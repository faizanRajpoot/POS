import 'package:get/get.dart';
import '../../controllers/loginController/logincontroller.dart';

class LoginBinding extends Bindings {

  @override

  void dependencies(){
    Get.lazyPut <LoginController>(() => LoginController());
  }
}