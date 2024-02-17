import 'dart:developer';
import 'package:assessment_app/configs/routes/main_route.dart';
import 'package:assessment_app/src/data/repositories/login_repository.dart';
import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var isChecked = false.obs;
  var obscureText = true.obs;

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  RxBool isAuthenticated = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    final isLoggedIn = LocalStorageService.token;
    if (isLoggedIn != '') {
      isAuthenticated.value = true;
    }
    final savedCred = await LocalStorageService.getRememberMe();
    usernameController.text = savedCred?['email'] ?? '';
    passwordController.text = savedCred?['password'] ?? '';
  }

  Future<void> postLogin() async {
    try {
      await saveCred();

      final response = await LoginRepository.postLogin(
        usernameController.text,
        passwordController.text,
      );
      if (response?.status ?? false) {
        Get.offAndToNamed(MainRoute.listAssessment);
      }
      log(response?.message ?? '');
    } catch (e, s) {
      log('$e :: $s');
    }
  }

  Future<void> saveCred() async {
    if (isChecked.value) {
      await LocalStorageService.rememberMe(
        email: usernameController.text,
        password: passwordController.text,
      );
    } else {
      await LocalStorageService.deleteRememberMe();
    }
  }

  Future<void> fingerPrint() async {
    try {
      final bool canAuthenticateWithBiometrics =
          await _localAuthentication.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics ||
          await _localAuthentication.isDeviceSupported();

      log(canAuthenticate.toString());

      final authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Authenticate to access the app',
        options: const AuthenticationOptions(biometricOnly: true),
      );
      if (authenticated) {
        Get.offAndToNamed(MainRoute.listAssessment);
      }
    } on PlatformException catch (e) {
      'Error authenticating: $e';
    }
  }
}
