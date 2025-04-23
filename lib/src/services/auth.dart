import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class FakeService extends GetxService {
  final Dio _dio = Dio();
  // var isAdmin = false.obs;
  var errormessage = false.obs;

  Future authenticate(String username, String password) async {
    final url = Uri.parse('http://127.0.0.1:8080/user');
    var a = await http.get(url);
    var data = jsonDecode(a.body);
    // Simulate API call delay
    await Future.delayed(Duration(seconds: 0));
    print(data);
    for (var i = 0; i < data.length; i++) {
      if (username == data[i]['username'] && password == data[i]['password']) {
        GetStorage box = GetStorage();
        box.write('login', true);

        // print('Login Successfully');
        return true;
      }
      //  else if (username != 'admin') {
      //   isAdmin.value = true;
      //   print('object');
      //   return false;
      // } else if (username == 'admin') {
      //   isAdmin.value = false;
      //   return false;
      // }
      else {
        errormessage.value = true;
        print('Invalid Credantials');
      }
//  else {
//       // ignore: deprecated_member_use
//       throw Exception(
//         'Invalid credentials',
//       );
//     }
    }
  }
}
