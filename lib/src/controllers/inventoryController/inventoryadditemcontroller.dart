import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/controllers/categoryController/categoryController.dart';
import 'package:flutter_application_1/src/models/error.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:get/get.dart';
import '../appbarController/appbarcontroller.dart';
import 'inventorycontroller.dart';
import 'package:http/http.dart' as http;

class InventoryAddItemController extends GetxController {
  CategoryController categoryController = Get.put(CategoryController());
  final InventoryController inventoryController =
      Get.find<InventoryController>();
  final AppbarController appbarController = Get.put(AppbarController());
  CustomerService cs = Get.put(CustomerService());
// Checks
  var nameCheck = true.obs;
  var brandCheck = true.obs;
  var totalCheck = true.obs;
  var sellingCheck = true.obs;
  var quantityCheck = true.obs;
  var updateCheck = false.obs;
  var categoryCheck = true.obs;

  // TextEditingController
  final nameController = TextEditingController();
  final selectCategory = TextEditingController();
  final brandController = TextEditingController();
  final totalController = TextEditingController();
  final sellingController = TextEditingController();
  final quantityController = TextEditingController();
  final imageController = TextEditingController();

  void Update() async {
    Map object = {
      "name": nameController.text.isEmpty ? 'Empty' : nameController.text,
      "category": selectCategory.text.isEmpty ? 'Empty' : selectCategory.text,
      "brand": brandController.text.isEmpty ? 'Empty' : brandController.text,
      "total": totalController.text.isEmpty ? 'Empty' : totalController.text,
      "selling":
          sellingController.text.isEmpty ? 'Empty' : sellingController.text,
      "quantity":
          quantityController.text.isEmpty ? 'Empty' : quantityController.text,
      "image": imageController.text.isEmpty ? 'Empty' : imageController.text,
    };
    nameController.clear();
    selectCategory.clear();
    brandController.clear();
    totalController.clear();
    sellingController.clear();
    quantityController.clear();
    imageController.clear();
    nameCheck.value = true;
    categoryCheck.value = true;
    brandCheck.value = true;
    totalCheck.value = true;
    sellingCheck.value = true;
    quantityCheck.value = true;
    appbarController.title.value = 'Inventory';
    cs.fetchedItems();
    update();
    Get.back();
    // print('hhhddd $object');

    try {
      final url = Uri.parse('http://127.0.0.1:8080/totalitems');
      http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(object));
    } on ErrorResponse catch (e, s) {
      print('e--- ${e.statusCode}');
      print('e--- ${e.statusMessage}');
      print('e--- $s');
    } catch (e, s) {
      print('--- $e');
    }
  }

  void Update2(i) async {
    print('okokok');
    List updateitem = [];
    Map object = {
      "name": nameController.text.isEmpty ? 'Empty' : nameController.text,
      "category": selectCategory.text.isEmpty ? 'Empty' : selectCategory.text,
      "brand": brandController.text.isEmpty ? 'Empty' : brandController.text,
      "total": totalController.text.isEmpty ? 'Empty' : totalController.text,
      "selling":
          sellingController.text.isEmpty ? 'Empty' : sellingController.text,
      "quantity":
          quantityController.text.isEmpty ? 'Empty' : quantityController.text,
      "image": imageController.text.isEmpty ? 'Empty' : imageController.text,
    };
    try {
      final url = Uri.parse('http://127.0.0.1:8080/totalitems');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      updateitem = qq;
    } catch (e) {
      print(e);
    }
    var filtered = updateitem[i]['id'];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/totalitems?id=$filtered');

      http.put(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(object));
    } on ErrorResponse catch (e, s) {
      print('e--- ${e.statusCode}');
      print('e--- ${e.statusMessage}');
      print('e--- $s');
    } catch (e, s) {
      print('--- $e');
    }
    cs.fetchedItems();
    updateCheck.value = false;
    Get.back();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  // final List<String> items = [
  //   'Item1',
  // ];

  // final selectedValue = ''.obs;

  //  var selectedValue;
  // var language = ['English', 'Espanol'];
  // void onSelected(String value) {
  //   selectedValue = value;
  // }

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  // ];

  // var selectedValue = Rx<String?>(null);

  // void setSelectedValue(String? value) {
  //   selectedValue.value = value;
  // }
  RxBool stack = false.obs;
  List data = [];

  void add() {
    // print('knk');
    data = categoryController.category;
    // data.add(categoryController.category[0]['name']);
  }
}
