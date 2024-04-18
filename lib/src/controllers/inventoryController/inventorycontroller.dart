import 'dart:convert';

import 'package:flutter_application_1/src/services/customer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../appbarController/appbarcontroller.dart';

class InventoryController extends GetxController {
  final AppbarController appbarController = Get.put(AppbarController());
  // final InventoryController inventoryCont = Get.put(InventoryController());
  CustomerService cs = Get.put(CustomerService());
  bool isLoading = true;

  int i = 0;
  @override
  void onInit() {
    if (Get.arguments != null) {
      i = Get.arguments['index'];
    }
    update();

    super.onInit();
  }

  @override
  void onReady() {
    // filterProduct('');
    print('lllllllllll');
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void filterProduct(String filterProduct) {
    List? results = [];
    if (filterProduct.isEmpty) {
      cs.fetchedItems();
    } else {
      results = cs.allproducts
          .where((allproducts) => allproducts['name']
              .toString()
              .toLowerCase()
              .contains(filterProduct.toLowerCase()))
          .toList();
    }

    cs.allproducts.value = results;
  }

  void filterBrand(String filterBrand) {
    List? results = [];
    if (filterBrand.isEmpty) {
      cs.fetchedItems();
    } else {
      results = cs.allproducts
          .where((allproducts) => allproducts['brand']
              .toString()
              .toLowerCase()
              .contains(filterBrand.toLowerCase()))
          .toList();
    }

    cs.allproducts.value = results;
  }


  void deleteProduct(int index) async {
    List deleteitem = [];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/totalitems');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      deleteitem = qq;
    } catch (e) {
      print(e);
    }
    var filtered = deleteitem[index]['id'];
    final url = Uri.parse('http://127.0.0.1:8080/totalitems?id=$filtered');
    http.delete(url);
    cs.allproducts.removeAt(index);
  }
}
