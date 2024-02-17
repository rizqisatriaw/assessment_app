import 'package:get/get.dart';

import '../controllers/list_assessment_controller.dart';

class ListAssessmentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListAssessmentController());
  }
}
