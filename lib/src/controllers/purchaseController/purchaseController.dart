import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/controllers/appbarController/appbarcontroller.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/error.dart';

class PurchaseController extends GetxController {
  AppbarController appbarController = Get.put(AppbarController());
  CustomerService service = Get.find<CustomerService>();
  RxBool supplierCheck = false.obs;
  RxBool productCheck = false.obs;
  RxBool outsideCheck = false.obs;
  RxBool totalBillCheck = false.obs;

  var j;
  var sum = 0.obs;
  var sum2;
  var suppliername = ''.obs;
  var subtotal = 0.obs;
  var supplier = [];
  var Pname = [];
  var Pprice = [];
  var Pqty = [];
  var Psubtotal = [];
  var obj2 = {};

  var items = [].obs;
  RxList foundSupplier = [].obs;
  RxList foundProduct = [].obs;
  List subTot = [].obs;
  List purchase = [];
  RxList damypurchase = [].obs;

  TextEditingController dateinput = TextEditingController();
  TextEditingController supplierTextField = TextEditingController();
  TextEditingController itemsTextField = TextEditingController();

  RxList data = [].obs;

  Future<void> addPurchase() async {
    for (var i = 0; i < data.length; i++) {
      Pname.add(data.value[i]['name']);
      Pprice.add(data.value[i]['selling'].toString());
      Psubtotal.add(data.value[i]['subTotal'].toString());
      Pqty.add(data.value[i]['quantity'].text);
    }
    var obj = {
      'name': [],
      'selling': [],
      'quantity': [],
      'subtotal': [],
      'supplier': suppliername.value,
      'date': dateinput.text,
      'grandtotal': sum.value
    };

    obj['name'] = Pname;
    obj['selling'] = Pprice;
    obj['quantity'] = Pqty;
    obj['subtotal'] = Psubtotal;

    obj2 = obj;

// Post Api
    try {
      final url = Uri.parse('http://127.0.0.1:8080/purchase');
      http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(obj2));
    } on ErrorResponse catch (e, s) {
      print('e--- ${e.statusCode}');
      print('e--- ${e.statusMessage}');
      print('e--- $s');
    } catch (e, s) {
      print('--- $e');
    }
// purchase.add(obj2);

// Get Api
    try {
      final url = Uri.parse('http://127.0.0.1:8080/purchase');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      purchase = qq;
      damypurchase(purchase);
      update();
      // print('initttttttttttttttttttttttttttttttttttttt $damypurchase');
    } catch (e) {
      print(e);
    }
    update();
  }

  void addRow(
    int id,
    String name,
    int total,
  ) {
    Map<String, dynamic> emptyRow = {
      'id': id,
      'name': name,
      'selling': total,
      'quantity': TextEditingController(text: '1'),
      'subTotal': total,
    };
    data.add(emptyRow);
  }

  void totalBillButton() {
    for (var i = 0; i < data.length; i++) {
      subTot.add(data[i]['subTotal'].toString());
    }
    for (String numbes in subTot) {
      sum += int.parse(numbes);
      sum2 = sum.value.toString();
    }
  }

  void deleteProduct(int index) {
    data.removeAt(index);
    subTot = [];
    sum2 = '';
    sum.value = 0;
    totalBillCheck.value = true;
  }

  void cancel() {
    data.clear();
    subTot.clear();
    subtotal.value = 0;
    suppliername.value = '';
    supplierTextField.text = '';
    dateinput.text = '';
    Pname = [];
    Pprice = [];
    Pqty = [];
    Psubtotal = [];
    sum.value = 0;
    update();
  }

  void filterSupplier(String filterSupplier) {
    supplier = service.allSupplierLength;
    List? results = [];
    if (filterSupplier.trim().isEmpty) {
      results = supplier;
    } else {
      results = supplier
          .where((supplier) => supplier['Name']
              .toString()
              .toLowerCase()
              .contains(filterSupplier.toLowerCase()))
          .toList();
    }
    foundSupplier(results);
  }

  void filterProduct(String filterProduct) {
    // supplier = service.allSupplierLength;
    List? results = [];
    if (filterProduct.trim().isEmpty) {
      results = items;
    } else {
      results = items
          .where((items) => items['name']
              .toString()
              .toLowerCase()
              .contains(filterProduct.toLowerCase()))
          .toList();
    }
    foundProduct(results);
  }

  @override
  void onInit() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8080/purchase');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      purchase = qq;
      damypurchase(purchase);
      update();
    } catch (e) {
      print(e);
    }
    update();
    service.supplierService();
    items = service.allproducts;
    supplier = service.allSupplierLength;
    // print(items);
    dateinput.text = '';
    super.onInit();
  }
}
