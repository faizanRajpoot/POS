import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Deviceinfo extends GetxService{


info () async{
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    // ignore: deprecated_member_use
    print(info.toMap());
  } else if (Platform.isIOS) {
    IosDeviceInfo info = await deviceInfo.iosInfo;
    print(info.toMap());
  } else if (Platform.isLinux) {
    LinuxDeviceInfo info = await deviceInfo.linuxInfo;
    print(info.toMap());
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo info = await deviceInfo.macOsInfo;
    print(info.toMap());
  } else if (Platform.isWindows) {
    WindowsDeviceInfo info = await deviceInfo.windowsInfo;
    print(info.toMap());
  }

  final info = await deviceInfo.deviceInfo;
  print(info.toMap());

   WidgetsFlutterBinding.ensureInitialized();

}

}