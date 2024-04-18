import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/customer.dart';
import '../inventoryController/inventorycontroller.dart';

class NewsaleController extends GetxController {
  // NewsaleController saleController = Get.put(NewsaleController());
  CustomerService cs = Get.put(CustomerService());
  var j;
  // RxList sendProducts = [].obs;
  RxList<Map<String, dynamic>> itemRows = <Map<String, dynamic>>[].obs;
  var subtotal = 0.obs;
  RxBool outsideCheck = false.obs;
  final ic = Get.find<InventoryController>();
  // For absolute div on search items
  bool isChecked = false;
  // Return Check
  bool isReturn = false;
  // Discount Check
  bool isDiscount = true;

  // Variables
  var sum = 0.obs;
  var sum2;
  var customerReturn;
  // customer arguments data
  var customerData = '';
  var customerDataClone = '';

  // Lists
  RxList foundProducts = [].obs;
  var salesarray = [];
  var obj2 = {};
  var Pname = [];
  var Pprice = [];
  var Pqty = [];
  var Psubtotal = [];

  fetchData() {
    if (Get.arguments != null) {
      customerData = Get.arguments['selectedCustomer'];
      customerDataClone = customerData;
    }
  }

  TextEditingController search = TextEditingController();
  TextEditingController customerPaid = TextEditingController();

  @override
  void onReady() {
    foundProducts.value = cs.allproducts;
    filterProducts('');
    super.onReady();
  }

  void del2() {
    Pname = [];
    Pprice = [];
    Pqty = [];
    customerDataClone = '';
    sum.value = 0;
  }

  void printsale() {
    for (var i = 0; i < itemRows.length; i++) {
      Pname.add(itemRows.value[i]['name']);
      Pprice.add(itemRows.value[i]['selling'].toString());
      Psubtotal.add(itemRows.value[i]['subTotal'].toString());
      Pqty.add(itemRows.value[i]['quantity'].text);
    }

    var obj = {
      'name': [],
      'qty': [],
      'price': [],
      'subprice': [],
      'customer': '',
      'total': ''
    };
    obj['name'] = Pname;

    obj['qty'] = Pqty;

    obj['price'] = Pprice;

    obj['subprice'] = Psubtotal;

    obj['total'] = sum2;

    obj['customer'] = customerDataClone;

    obj2 = obj;
    salesarray.add(obj2);
  }

  @override
  void onInit() {
    salesarray = [
      {
        'name': ['S3', "S4"],
        'qty': ['2', '1'],
        'subprice': ['1000', "2000"],
        'price': ['500', '2000'],
        'customer': 'faizan',
        'total': '3000'
      },
    ];

    super.onInit();
  }

  void addRow(
    int id,
    String name,
    String brand,
    int selling,
  ) {
    Map<String, dynamic> emptyRow = {
      'id': id,
      'name': name,
      'brand': brand,
      'selling': selling,
      'quantity': TextEditingController(text: '1'),
      'subTotal': selling
    };
    itemRows.add(emptyRow);
  }

  void paid() {
    retur();
    isReturn = true;
    update();
  }

  void retur() {
    customerReturn = int.parse(customerPaid.text) - sum.value;
    // print("Return $s");
  }

  void totalBillButton() {
    List subTot = [];
    for (var i = 0; i < itemRows.length; i++) {
      subTot.add(itemRows[i]['subTotal'].toString());
      print(subTot);
    }

    for (String numbes in subTot) {
      sum += int.parse(numbes);
      sum2 = sum.value.toString();
    }
  }

  void filterProducts(String filterProducts) {
    List? results = [];
    if (filterProducts.isEmpty) {
      results = [];
      isChecked = false;
    } else {
      results = cs.allproducts
          .where((allproducts) => allproducts['name']
              .toString()
              .toLowerCase()
              .contains(filterProducts.toLowerCase()))
          .toList();
    }
    update();
    foundProducts.value = results;
  }

  void deleteProduct(int index) {
    itemRows.removeAt(index);
  }

  void clearAll() {
    itemRows.clear();
    sum.value = 0;
    customerReturn = 0;
    isReturn = false;
    customerDataClone = '';
    update();
    del2();
  }
}
