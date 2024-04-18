import 'package:flutter_application_1/src/controllers/expenseController/expenseController.dart';
import 'package:get/get.dart';

class ExpenseBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<ExpenseController>(() => ExpenseController());
  }
}
