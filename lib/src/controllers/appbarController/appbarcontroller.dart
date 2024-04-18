import 'package:get/get.dart';

class AppbarController extends GetxController{

  var title = "".obs;

  void changeTitle(String newTitle){
    title.value = newTitle;
  }
}