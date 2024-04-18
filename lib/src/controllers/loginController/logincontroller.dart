import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/auth.dart';
import '../../utils/routes/routes.dart';

class LoginController extends GetxController {
  // final FakeService _apiService = FakeService();
  final FakeService apiService = Get.find<FakeService>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var passwordVisible = false.obs;
  final RxBool isLoading = false.obs;

  void login() async {
    isLoading.value = true;

    final String username = usernameController.text;
    final String password = passwordController.text;

    try {
      final bool isAuthenticated =
          await apiService.authenticate(username, password);
      if (isAuthenticated) {
        Get.toNamed(Routes.dashboard);
        print('Login successful');
      } else {
        print('authentication fail');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
