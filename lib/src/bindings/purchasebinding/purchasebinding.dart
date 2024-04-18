import 'package:flutter_application_1/src/controllers/purchaseController/purchaseController.dart';
import 'package:get/get.dart';

class PurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseController>(() => PurchaseController());
  }
}
