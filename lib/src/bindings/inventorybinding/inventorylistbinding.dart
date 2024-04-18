import 'package:get/get.dart';
import '../../controllers/inventoryController/inventorylist_controller.dart';

class InventoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryListController>(() => InventoryListController());
  }
}
