import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/error.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SupplierController extends GetxController {
  RxBool istrue = false.obs;
  var nameCheck = true.obs;
  var emailCheck = true.obs;
  var phonenumberCheck = true.obs;

  TextEditingController enterName = TextEditingController();
  TextEditingController enterEmail = TextEditingController();
  TextEditingController enterPhoneNumber = TextEditingController();

  List allSupplier = [];
  RxList foundSupplier = [].obs;

   void onInit() async {

    try {
      final url = Uri.parse('http://127.0.0.1:8080/supplier');
      var a = await http.get(url);
      allSupplier = jsonDecode(a.body);
      // print('DFDFMMNLKD ${e}');
      // print(allSupplier);
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
    foundSupplier(allSupplier);
    super.onReady();
  }


  void filterSupplier(String filterSupplier) {
    List? results = [];
    if (filterSupplier.trim().isEmpty) {
      results = allSupplier;
    } else {
      results = allSupplier
          .where((allSupplier) => allSupplier['Name']
              .toString()
              .toLowerCase()
              .contains(filterSupplier.toLowerCase()))
          .toList();
    }
    foundSupplier(results);
  }

  void sendData() async {
    var object = {
      "Name": enterName.text.isEmpty ? 'Empty' : enterName.text,
      "Email": enterEmail.text.isEmpty ? 'Empty' : enterEmail.text,
      "phNum": enterPhoneNumber.text.isEmpty ? 'Empty' : enterPhoneNumber.text,
    };
    try {
      final url = Uri.parse('http://127.0.0.1:8080/supplier');
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

    // allSupplier.add(object);

    try {
      final url = Uri.parse('http://127.0.0.1:8080/supplier');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      allSupplier = qq;
      foundSupplier(allSupplier);
      update();
    } catch (e) {
      print(e);
    }
    update();
  }

  void deleteSupplier(int index) async {
    List deleteSupplier = [];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/supplier');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      deleteSupplier = qq;
    } catch (e) {
      print(e);
    }
    var filtered = deleteSupplier[index]['id'];
    final url = Uri.parse('http://127.0.0.1:8080/supplier?id=$filtered');
    http.delete(url);
    foundSupplier.removeAt(index);
  }
}
