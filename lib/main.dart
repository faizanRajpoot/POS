// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/app.dart';
import 'package:flutter_application_1/src/services/auth.dart';
import 'package:flutter_application_1/src/services/customer.dart';
import 'package:flutter_application_1/src/services/deviceinfo.dart';
import 'package:flutter_application_1/src/services/restclient.dart';
import 'package:flutter_application_1/src/services/settings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:sqflite/sqflite.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize services here
  await initializeServices();
  GetStorage.init();
  runApp(MyApp());
}

Future<void> initializeServices() async {
  // await Firebase.initializeApp();
  Deviceinfo deviceinfo = Get.put(Deviceinfo());
  deviceinfo.info();
  FakeService auth = Get.put(FakeService());
  CustomerService customerService = Get.put(CustomerService());
  customerService.customerService();
  customerService.fetchedItems();
  SettingsService settings = SettingsService();
  Get.putAsync(() => settings.init());
  RestClient rest = RestClient();
  Get.putAsync(() => rest.init());
}
