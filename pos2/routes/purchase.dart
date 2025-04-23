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

  if (method == 'GET') {
    dynamic result = await db.query('purchase');
    s = result;
    // var oj={
    //    'date': s[0]['date'],
    //   'productname': s[0][jsonDecode('productname')],
    //   'productqty': s[0][jsonDecode('productqty')],
    //   'productprice':s[0][jsonDecode('productprice')],
    //   'subtotal': s[0][jsonDecode('subtotal')],
    //   'suppliername': s[0]['supplier'],
    //   'grandtotal': s[0]['grandtotal'],
    // };
    // print(oj);

    return Response.json(body: result);
  }

  if (method == 'POST') {
    final body = await request.json();

    

    var dates = body['date'];
    var productNames = body['name'];
    var productQuantities = body['quantity'];
    var productPrices = body['selling'];
    var subtotals = body['subtotal'];
    var suppliernames = body['supplier'];
    var grandtotals = body['grandtotal'];

    await db.insert('purchase', {
      'date': dates,
      'productname': jsonEncode(productNames),
      'productqty': jsonEncode(productQuantities),
      'productprice': jsonEncode(productPrices),
      'subtotal': jsonEncode(subtotals),
      'suppliername': body['supplier'],
      'grandtotal': body['grandtotal'],
    });
    var result = await db.query('purchase');
  }

  if (method == 'DELETE') {
    final params = request.uri.queryParameters;
    final id = params['id'];
    await db.delete(
      'purchase',
      where: 'id = $id',
    );
  }

  return Response(body: 'This is a new route of purchase!');
}
