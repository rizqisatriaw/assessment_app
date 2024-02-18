import 'dart:developer';

import 'package:assessment_app/src/data/models/test_assessment_response.dart';
import 'package:assessment_app/src/data/repositories/test_assessment_repository.dart';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';

class TestAssessmentController extends GetxController {
  static TestAssessmentController get to => Get.find();

  RxString id = RxString('');
  TestAssessmentResponse? testResponse;

  RxInt selectedOption = 0.obs;
  RxInt indexQuestion = 0.obs;

  @override
  void onInit() {
    var args = Get.arguments;
    id.value = args;
    fetchTestAssessment();
    super.onInit();
  }

  Future<void> fetchTestAssessment() async {
    var response =
        await TestAssessmentRepository.fetchTest(assessmentId: id.value);
    if (response?.status ?? false) {
      log("response status = ${response?.status}");
      testResponse = response;
      update();
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }
}
