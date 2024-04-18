import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CustomerService extends GetxService {
  RxList allproducts = [].obs;
  RxList allcategory = [].obs;

  List allCustomersLength = [];
  var allSupplierLength = [];

  int? i;

  Future customerService() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8080/customer');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      allCustomersLength = qq;
      // foundCustomer(allCustomers);
    } catch (e) {
      print(e);
    }
  }

  Future supplierService() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8080/supplier');
      var a = await http.get(url);
      allSupplierLength = jsonDecode(a.body);
      // print('hhhhgggggfffffdddddcccccc $allSupplierLength');
      // allSupplierLength = qq;
      // foundCustomer(allCustomers);
    } catch (e) {
      print(e);
    }
  }

  Future fetchedItems() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8080/totalitems');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      allproducts(qq);
    } catch (e) {
      print(e);
    }

// category length
    try {
      final url = Uri.parse('http://127.0.0.1:8080/category');
      var a = await http.get(url);
      var qq = jsonDecode(a.body);
      allcategory(qq);
    } catch (e) {
      print(e);
    }
  }
}
