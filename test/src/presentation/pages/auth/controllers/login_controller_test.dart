import 'package:assessment_app/src/data/repositories/login_repository.dart';
import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:assessment_app/src/presentation/pages/auth/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  group('LoginController', () {
    late LoginController loginController;

    setUp(() {
      loginController = LoginController();
    });

    tearDown(() {
      loginController.dispose();
    });

    test('Initial values are set correctly', () {
      expect(loginController.isChecked.value, false);
      expect(loginController.obscureText.value, true);
      expect(loginController.isAuthenticated.value, false);
      expect(loginController.usernameController.text, '');
      expect(loginController.passwordController.text, '');
    });

    test('Post login without credentials does not authenticate', () async {
      await loginController.postLogin();
      expect(loginController.isAuthenticated.value, false);
    });
  });
}
