import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/src/controllers/appbarController/appbarcontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/error.dart';

class ExpenseController extends GetxController {
  AppbarController appbarController = Get.find<AppbarController>();
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameField = TextEditingController();
  TextEditingController amountField = TextEditingController();
  TextEditingController referenceField = TextEditingController();
  List damyexpense = [];
  RxList expense = [].obs;


  void addExpense() async{
    var obj = {
      'date': dateinput.text,
      'name': nameField.text,
      'amount': amountField.text,
      'reference': referenceField.text
    };
    // expense.add(obj);
    dateinput.text = '';
    nameField.text = '';
    amountField.text = '';
    referenceField.text = '';

    // Post Api
    try {
      final url = Uri.parse('http://127.0.0.1:8080/expense');
      http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(obj));
    } on ErrorResponse catch (e, s) {
      print('e--- ${e.statusCode}');
      print('e--- ${e.statusMessage}');
      print('e--- $s');
    } catch (e, s) {
      print('--- $e');
    }

    // Get Api
    try {
      final url = Uri.parse('http://127.0.0.1:8080/expense');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      damyexpense = qq;
      expense(damyexpense);
      update();
    } catch (e) {
      print(e);
    }
    update();
  }

  void Cancel() {
    dateinput.text = '';
    nameField.text = '';
    amountField.text = '';
    referenceField.text = '';
  }

    void Delete(int index) async {
    List deleteitem = [];

    try {
      final url = Uri.parse('http://127.0.0.1:8080/expense');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      deleteitem = qq;
    } catch (e) {
      print(e);
    }
    var filtered = deleteitem[index]['id'];
    final url = Uri.parse('http://127.0.0.1:8080/expense?id=$filtered');
    http.delete(url);
    expense.removeAt(index);
  }

  @override
  void onInit() async{
        // Get Api
    try {
      final url = Uri.parse('http://127.0.0.1:8080/expense');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      damyexpense = qq;
      expense(damyexpense);
      update();
    } catch (e) {
      print(e);
    }
    update();
    super.onInit();
  }
}
