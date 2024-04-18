import 'dart:async';
// import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';

// configs
import 'package:flutter_application_1/src/utils/helpers/dio_helper.dart';
import 'package:flutter_application_1/src/utils/config/config.dart';

// models
import 'package:flutter_application_1/src/models/error.dart';
import 'package:flutter_application_1/src/models/login.dart';

// import '../utils/uidata.dart';
// import 'package:flutter_application_1/src/utils/routes/app_routes.dart';
// import './auth.dart';
// import 'package:flutter_application_1/src/ui/views/error.dart';
enum RequestType { post, get, put, patch, delete }

class RestClient extends GetxService {
  final bool debug = true;
  // final AuthService authService = Get.find<AuthService>();
  int retries = 0;

  Future<RestClient> init() async {
    await DioHelper.init(ServerData.hostname);
    await DioHelper.initCookies();
    return this;
  }

  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await _sendRequest(
      '/method/login',
      data: loginRequest.toJson(),
      type: RequestType.post,
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.headers.map["set-cookie"] != null) {
        if (response.headers.map["set-cookie"]?[3] != null) {
          response.data["user_id"] = response.headers.map["set-cookie"]![3]
              .split(';')[0]
              .split('=')[1];
        }
      }
      return LoginResponse.fromJson(response.data);
    } else {
      throw ErrorResponse(
        statusMessage: response.data["message"],
        statusCode: response.statusCode,
      );
    }
  }

  Future<dynamic> sendRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    RequestType type = RequestType.get,
  }) async {
    Response result = await _sendRequest(endpoint, data: data, type: type);
    return result.data;
  }

  bool validateStatus(int? status) {
    if (status != null) {
      return status < 500;
    } else {
      return false;
    }
  }

  Future<Response> _sendRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    RequestType type = RequestType.get,
  }) async {
    try {
      late final Response response;
      switch (type) {
        case RequestType.post:
          response = await DioHelper.dio.post(
            endpoint,
            data: data,
            options: Options(
              validateStatus: validateStatus,
            ),
          );
          break;
        case RequestType.get:
          response = await DioHelper.dio.get(
            endpoint,
            queryParameters: data,
            options: Options(
              headers: {
                'Accept': '*/*',
                'Content-Type': 'application/json',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'Keep-Alive',
                'User-Agent': 'Dart',
              },
              validateStatus: (status) {
                if (status != null) {
                  return status < 500;
                } else {
                  return false;
                }
              },
            ),
          );
          break;
        case RequestType.put:
          response = await DioHelper.dio.put(
            endpoint,
            queryParameters: data,
            options: Options(
              validateStatus: (status) {
                if (status != null) {
                  return status < 500;
                } else {
                  return false;
                }
              },
            ),
          );
          break;
        case RequestType.delete:
        case RequestType.patch:
          throw UnimplementedError();
      }
      return response;
    } catch (e, s) {
      if ((e is! DioException)) rethrow;

      // print(e.type);
      // print(e.message);
      // print(e.response);
      // print(s);
      final error = e.error;
      if (error is SocketException) {
        throw ErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: error.message,
        );
      }

      if (error is HandshakeException) {
        throw ErrorResponse(
          statusCode: HttpStatus.serviceUnavailable,
          statusMessage: "Cannot connect securely to server."
              " Please ensure that the server has a valid SSL configuration.",
        );
      }
      throw ErrorResponse(
          statusCode: e.response?.statusCode ?? 500,
          statusMessage: e.message ?? 'Something went wrong');
    }
  }
}
