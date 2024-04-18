import 'package:get/get.dart';
import '../../controllers/newsaleController/newsaleController.dart';

class NewsaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsaleController>(() => NewsaleController());
  }
}
