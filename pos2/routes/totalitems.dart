import 'package:path/path.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Response> onRequest(RequestContext context) async {
  sqfliteFfiInit();
  String databasePath = '/Users/macbookpro/Documents/flutterWork/pos2';
  String path = join(databasePath, 'poss.db');
  Database db = await databaseFactoryFfi.openDatabase(path);

  final request = context.request;
  final method = request.method.value;

  if (method == 'GET') {
    dynamic result = await db.query('totalitems');

    return Response.json(body: result);
  }

  if (method == 'POST') {
    final body = await request.json();
    await db.insert('totalitems', {
      'name': body['name'],
      'category': body['category'],
      'brand': body['brand'],
      'total': body['total'],
      'selling': body['selling'],
      'quantity': body['quantity']
    });
    // var result = await db.query('totalitems');
  }

  if (method == 'PUT') {
    final params = request.uri.queryParameters;
    final id = params['id'];

    final body = await request.json();

    try {
      await db.update(
        'totalitems',
        {
          'name': body['name'],
          'category': body['category'],
          'brand': body['brand'],
          'total': body['total'],
          'selling': body['selling'],
          'quantity': body['quantity']
        },
        where: 'id=?',
        whereArgs: [id],
      );
    } catch (e) {
      print('erorrrr ${e.toString()}');
    }
  }

  if (method == 'DELETE') {
    final params = request.uri.queryParameters;
    final id = params['id'];
    await db.delete(
      'totalitems',
      where: 'id = $id',
    );
  }

  // print(result);
  return Response(body: 'This is a new route of total Items!');
}
