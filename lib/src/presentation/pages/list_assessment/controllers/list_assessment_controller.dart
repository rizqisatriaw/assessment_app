import 'dart:developer';
import 'package:get/get.dart';

import '../../../../../configs/themes/color_themes.dart';
import '../../../../data/repositories/list_assessment_repository.dart';
import '../../../../domain/entities/list_assessment/assessment.dart';

class ListAssessmentController extends GetxController {
  static ListAssessmentController get to => Get.find();

  RxInt dataOffset = RxInt(1);
  RxInt totalData = RxInt(0);
  RxBool isLoading = RxBool(false);
  RxList<Assessment> assessmentList = RxList.empty();

  bool get isLoadMore =>
      assessmentList.length != totalData.value && isLoading.value == false;

  @override
  void onInit() {
    fetchListAssessment(offset: 1);
    super.onInit();
  }

  Future<void> fetchListAssessment({int? offset}) async {
    try {
      isLoading.value = true;
      if (offset != null) {
        dataOffset.value = offset;
      }
      final response = await ListAssessmentRepository.fetchAssessments(
        dataOffset: dataOffset.value,
      );
      if (response?.status ?? false) {
        totalData.value = response?.totalData ?? 0;
        assessmentList.addAll(response?.data ?? []);
        dataOffset.value += 1;

        isLoading.value = false;
      }
    } catch (e, s) {
      log('$e :: $s');
      Get.snackbar(
        'Data is Empty',
        'Please try again later',
        backgroundColor: ColorThemes.white,
      );
    }
  }
}
