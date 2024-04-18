import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/models/error.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  // CategoryController categoryController = Get.put(CategoryController());
  TextEditingController enterCategName = TextEditingController();
  RxBool istrue = false.obs;
  var categNameCheck = true.obs;

  dynamic category = [].obs;
  RxInt j = 0.obs;
  RxList foundCategory = [].obs;
  bool check = false;

  void sendData() async {
    var object = {
      "name": enterCategName.text.isEmpty ? 'Empty' : enterCategName.text,
    };
    try {
      final url = Uri.parse('http://127.0.0.1:8080/category');
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

    try {
      final url = Uri.parse('http://127.0.0.1:8080/category');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      category = qq;
      j.value = category.length;

      foundCategory(category);
      update();
    } catch (e) {
      print(e);
    }
    update();
  }

  @override
  void onReady() {
    foundCategory(category);
    super.onReady();
  }

  @override
  void onInit() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8080/category');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      category = qq;
      j.value = category.length;
      // print(category);
    } catch (e) {
      print('$e bbbbbbb');
    }
    update();
    super.onInit();
  }

  void filterCategory(String filterCategory) {
    List? results = [];
    if (filterCategory.trim().isEmpty) {
      results = category;
    } else {
      results = category
          .where((category) => category['name']
              .toString()
              .toLowerCase()
              .contains(filterCategory.toLowerCase()))
          .toList();
    }
    foundCategory(results);
  }
}
// faizan@gmail.com
