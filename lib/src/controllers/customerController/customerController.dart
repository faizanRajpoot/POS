import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../services/restclient.dart';
import 'package:flutter_application_1/src/models/error.dart';

class CustomerController extends GetxController {
  RestClient restClient = Get.find<RestClient>();
  TextEditingController searchName = TextEditingController();
  TextEditingController enterFirstName = TextEditingController();
  TextEditingController enterLastName = TextEditingController();
  TextEditingController enterPhoneNumber = TextEditingController();
// Check for absolute container add customer
  bool istrue = false;
// Checks for textFields
  var firstnameCheck = true.obs;
  var lastnameCheck = true.obs;
  var phonenumberCheck = true.obs;
  var check;
  void sendData() async {
    var object = {
      "firstName": enterFirstName.text.isEmpty ? 'Empty' : enterFirstName.text,
      "lastName": enterLastName.text.isEmpty ? 'Empty' : enterLastName.text,
      "phNum": enterPhoneNumber.text.isEmpty ? 'Empty' : enterPhoneNumber.text,
    };
    try {
      final url = Uri.parse('http://127.0.0.1:8080/customer');
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
    // allCustomers.add(object);

    try {
      final url = Uri.parse('http://127.0.0.1:8080/customer');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      allCustomers = qq;
      foundCustomer(allCustomers);

      update();
    } catch (e) {
      print(e);
    }
    update();
  }

  List allCustomers = [];
  RxList foundCustomer = [].obs;

  int i = 0;

  void onInit() async {
    // allCustomers = [
    //   {"firstName": "faizan", "lastName": "ahmad", "phNum": "03014435121"},
    //   {"firstName": "subhan", "lastName": "ayub", "phNum": "03191636108"},
    //   {"firstName": "hamza", "lastName": "ali", "phNum": "03228550616"},
    // ];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/customer');
      var a = await http.get(url);

      allCustomers = jsonDecode(a.body);
      // print('DFDFMMNLKD ${e}');
      // print(allCustomers);
    } catch (e) {
      print(e);
    }

    // if (Get.arguments != null) {
    //   i = Get.arguments['index'];
    // }
    update();

    super.onInit();
  }

  @override
  void onReady() {
    // print(allCustomers);
    foundCustomer(allCustomers);
    super.onReady();
  }

  void filterCustomer(String filterCustomer) {
    List? results = [];
    if (filterCustomer.trim().isEmpty) {
      results = allCustomers;
    } else {
      results = allCustomers
          .where((allCustomers) => allCustomers['firstName']
              .toString()
              .toLowerCase()
              .contains(filterCustomer.toLowerCase()))
          .toList();
    }
    foundCustomer(results);
  }

  void deleteCustomer(int index) async {
    List deletecutomer = [];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/customer');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      deletecutomer = qq;
    } catch (e) {
      print(e);
    }

    var filtered = deletecutomer[index]['id'];

    final url = Uri.parse('http://127.0.0.1:8080/customer?id=$filtered');
     http.delete(url);
    foundCustomer.removeAt(index);

  }
}
