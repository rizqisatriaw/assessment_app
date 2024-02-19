import 'dart:developer';

import 'package:assessment_app/src/data/models/test_assessment_response.dart';
import 'package:assessment_app/src/data/repositories/test_assessment_repository.dart';
import 'package:assessment_app/src/domain/entities/test_assessment/option.dart';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../../domain/entities/test_assessment/question.dart';

class TestAssessmentController extends GetxController {
  static TestAssessmentController get to => Get.find();

  RxString id = RxString('');
  TestAssessmentResponse? testResponse;

  var isChecked = false.obs;
  RxList<bool> selectedChecked = [false, false, false, false, false].obs;
  Rx<Option?>? selectedOptions = Rx<Option>(Option());
  RxInt indexQuestion = 0.obs;
  RxList<Question> questionList = RxList.empty();
  int get questionView => indexQuestion.value + 1;
  Question get currentQuestion => questionList[indexQuestion.value];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    var args = Get.arguments;
    id.value = args;
    fetchTestAssessment();
    super.onInit();
  }

  Future<void> fetchTestAssessment() async {
    isLoading.value = true;
    var response =
        await TestAssessmentRepository.fetchTest(assessmentId: id.value);
    if (response?.status ?? false) {
      log("response status = ${response?.status}");
      testResponse = response;
      questionList.addAll(response?.data?.question ?? []);
      update();
    } else {
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
    isLoading.value = false;
  }

  void handleRadioValueChange(Option? value) {
    selectedOptions?.value = value;
  }

  void setCheckBoxAnswer(int index, bool value) {
    selectedChecked[index] = value;
    update();
  }
}
