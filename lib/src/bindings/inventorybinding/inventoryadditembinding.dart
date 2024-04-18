import 'package:get/get.dart';
import '../../controllers/inventoryController/inventoryadditemcontroller.dart';

class InventoryAddItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryAddItemController>(() => InventoryAddItemController());
  }
}
