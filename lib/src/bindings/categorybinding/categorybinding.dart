import 'package:flutter_application_1/src/controllers/categoryController/categoryController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CategoryBinding extends Bindings{
   @override

  void dependencies(){
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}