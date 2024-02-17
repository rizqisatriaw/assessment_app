import 'package:assessment_app/src/presentation/pages/test_assessment/view/test_assessment_view.dart';
import 'package:get/get.dart';

import '../../src/presentation/pages/auth/bindings/login_binding.dart';
import '../../src/presentation/pages/auth/view/login_view.dart';
import '../../src/presentation/pages/list_assessment/bindings/list_assessment_binding.dart';
import '../../src/presentation/pages/list_assessment/view/list_assessment_view.dart';
import '../../src/presentation/pages/test_assessment/bindings/test_assessment_binding.dart';
import 'main_route.dart';

abstract class MainPage {
  static final main = [
    /// GetPage Login
    GetPage(
      name: MainRoute.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),

    /// GetPage ListAssessment
    GetPage(
      name: MainRoute.listAssessment,
      page: () => const ListAssessmentView(),
      binding: ListAssessmentBinding(),
    ),

    /// GetPage TestAssessment
    GetPage(
      name: MainRoute.testAssessment,
      page: () => const TestAssessmentView(),
      binding: TestAssessmentBinding(),
    ),
  ];
}
