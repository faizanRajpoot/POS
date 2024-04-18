import 'package:flutter_application_1/src/controllers/supplier/supplierController.dart';
import 'package:get/get.dart';

class SupplierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierController>(() => SupplierController());
  }
}
