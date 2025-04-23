// import 'dart:ui' as ui;
import 'package:dart_frog/dart_frog.dart';
// import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
// import 'package:sqflite_common_ffi_web/src/sqflite_ffi_io.dart';


Future<Response> onRequest(RequestContext context) async {
  sqfliteFfiInit();
  String databasePath = '/Users/macbookpro/Documents/flutterWork/pos2';
  String path = join(databasePath, 'poss.db');
  // var factory = databaseFactoryFfi;
  // if (kIsWeb) {
  //   // Change default factory on the web
  //   print('webbbb');
  //   databaseFactory = databaseFactoryFfiWeb;
  //   path = join(databasePath, 'poss.db');
  //   // 'my_web_web.db';
  // }
  Database db = await databaseFactoryFfi.openDatabase(path);

  final request = context.request;
  final method = request.method.value;

  var check;

  if (method == 'GET') {
    dynamic result = await db.query('login');
    check = result;
    return Response.json(body: result);
  }

  return Response(body: 'This is a new route of login $check');
}
