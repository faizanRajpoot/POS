import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  final Priority = 0;

  @override
  RouteSettings? redirect(route) {
    GetStorage box = GetStorage();
    //  print('${box.read('login')}, ok');
    return box.read('login') != null ? null : RouteSettings(name: Routes.loginroute);
  }
}
