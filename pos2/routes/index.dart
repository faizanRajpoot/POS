import 'package:path/path.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Response> onRequest(RequestContext context) async {
  sqfliteFfiInit();
  DatabaseFactory databaseFactory = databaseFactoryFfi;
  String databasesPath = '/Users/macbookpro/Documents/flutterWork/pos2';
  String path = join(databasesPath, 'poss.db');
  Database db = await databaseFactory.openDatabase(path);


  // var aa;

// // Insert some records in a transaction
//   await db.transaction((txn) async {
//     var a1 = await txn.rawInsert('SELECT val FROM Test');
//     aa = a1;
//     print('inserted1: $a1');
//   });

//  await db.execute('''CREATE TABLE Product (id INTEGER PRIMARY KEY,title TEXT)''');
  // await db.insert('Test', <String, Object?>{'nam': 'Product 1'});
  // await db.insert('Product', <String, Object?>{'title': 'Product 1'});

  // var result = await db.query('Test');
  // print(result);



  return Response(body: 'Welcome to Dart Frog!');
}
