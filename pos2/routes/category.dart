// ignore_for_file: omit_local_variable_types, unused_local_variable, prefer_final_locals
import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

Future<Response> onRequest(RequestContext context) async {
  sqfliteFfiInit();
  String databasePath = '/Users/macbookpro/Documents/flutterWork/pos2';
  String path = join(databasePath, 'poss.db');
  Database db = await databaseFactoryFfi.openDatabase(path);

  final request = context.request;
  final method = request.method.value;
  var s;
  var a;
  if (method == 'GET') {
    dynamic result = await db.query('category');
    s = result;
    return Response.json(body: result);
  }

  if (method == 'POST') {
    final body =await request.json();
    // print(body['name']); 
    await db.insert('category', {
      'name': body['name'],
    });
    var result = await db.query('category');
    a = result;
  }

  return Response(body: 'This is a new route of categ! $a');
}
