// import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// ignore: depend_on_referenced_packages
// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

import 'package:flutter_application_1/src/utils/config/config.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioHelper {
  static late Dio dio;
  static late String cookies;

  static Future init(String baseUrl) async {
    // var cookieJar = await getCookiePath();
    dio = Dio(
      BaseOptions(
        // baseUrl: "${ServerData.hostname}/api",
        baseUrl: "${ServerData.hostname}",
      ),
    )
        // ..interceptors.add(
        //     CookieManager(cookieJar),
        //   )
        ;
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
    dio.options.connectTimeout = Duration(seconds: 60);
    dio.options.receiveTimeout = Duration(seconds: 60);
  }

  static Future initCookies() async {
    // cookies = await getCookies();
  }

  // static Future<PersistCookieJar> getCookiePath() async {
  // Directory appDocDir = await getApplicationSupportDirectory();
  // String appDocPath = appDocDir.path;
  // return PersistCookieJar(
  //     ignoreExpires: true, storage: FileStorage(appDocPath));
  // }

  // static Future<String> getCookies() async {
  //   var cookieJar = await getCookiePath();
  //   Uri uri = Uri.parse(ServerData.hostname);
  //   var cookies = await cookieJar.loadForRequest(uri);
  //   var cookie = CookieManager.getCookies(cookies);
  //   return cookie;
  // }
}
