import 'package:get/get.dart';
import '../../controllers/dashboardController/dashboardcontroller.dart';

class DashboardBinding extends Bindings{
  @override

  void dependencies(){
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}