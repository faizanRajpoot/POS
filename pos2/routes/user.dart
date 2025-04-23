import 'package:dart_frog/dart_frog.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import 'package:sqflite/sqflite.dart';
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
    dynamic result = await db.query('user');
    s = result;
    return Response.json(body: result);
  }

  return Response(body: 'This is a new route of users! $s');
}



