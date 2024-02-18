import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService extends GetxService {
  LocalStorageService._();
  static final box = Hive.box('user');

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox('user');
  }

  static Future<void> rememberMe({
    required String email,
    required String password,
  }) async {
    final data = {
      'email': email,
      'password': password,
    };

    final dataJsonString = jsonEncode(data);

    await box.put('remember_me', dataJsonString);
  }

  static Future<Map<String, dynamic>?> getRememberMe() async {
    final data = await box.get('remember_me', defaultValue: '') as String;
    if (data != '') {
      final decoded = jsonDecode(data);
      return decoded;
    }
    return null;
  }

  static Future<void> deleteRememberMe() async {
    await box.put('remember_me', '');
  }

  static Future<void> setToken(String token) async {
    await box.put('token', token.toString());
  }

  static String get token => box.get('token', defaultValue: '') as String;

  static Future<void> logout() async {
    await box.clear();
  }
}
