import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:dio/dio.dart';

import '../../../configs/constants/api_const.dart';
import '../../domain/services/global_dio.dart';
import '../models/login_response.dart';

class LoginRepository {
  static Future<LoginResponse?> postLogin(String nik, String password) async {
    try {
      Map<String, dynamic> data = {
        "nik": nik,
        "password": password,
      };

      final response = await globalDio.post(
        ApiConst.loginUrl,
        data: data,
      );

      final headersResponse = response.headers['set-cookie'];

      if (headersResponse != null) {
        final token = _extractTokenFromCookieHeader(headersResponse[0]);
        LocalStorageService.setToken(token);
      }

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(
          response.data,
        );
      } else {
        return LoginResponse(
          status: false,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return LoginResponse(
          status: false,
          message: 'Connection Error',
        );
      } else {
        return LoginResponse(
          status: false,
          message: 'Server Error',
        );
      }
    }
  }

  static String _extractTokenFromCookieHeader(String cookieHeader) {
    // Split cookie header by ';'
    List<String> parts = cookieHeader.split(';');
    // Iterate through parts to find the token cookie
    for (String part in parts) {
      if (part.trim().startsWith('token')) {
        // Extract token value
        List<String> tokenParts = part.trim().split('=');
        if (tokenParts.length == 2) {
          return tokenParts[1];
        }
      }
    }

    return ''; // Token not found
  }
}
