import 'package:get/get.dart';
import '../../controllers/inventoryController/inventorycontroller.dart';

class InventorydBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }
}
