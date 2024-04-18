import 'package:get/get.dart';

class InventoryListController extends GetxController {
  bool isLoading = true;

  Map v = {};

  @override
  void onInit() {
    if (Get.arguments != null) {
      v = Get.arguments['productValue'];
    }
    update();
    // print("check Data $v");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
