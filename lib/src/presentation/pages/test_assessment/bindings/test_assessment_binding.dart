import 'package:get/get.dart';

import '../controller/test_assessment_controller.dart';

class TestAssessmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TestAssessmentController());
  }
}
