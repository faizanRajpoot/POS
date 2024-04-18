import 'package:flutter_application_1/src/controllers/customerController/customerController.dart';
import 'package:flutter_application_1/src/controllers/newsaleController/newsaleController.dart';
import 'package:get/get.dart';

class CustomerBinding extends Bindings{
   @override

  void dependencies(){
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}