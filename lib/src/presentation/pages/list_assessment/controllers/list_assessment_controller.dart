import 'dart:developer';

import 'package:assessment_app/src/domain/services/global_dio.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/list_assessment_repository.dart';
import '../../../../domain/entities/list_assessment/assessment.dart';
import '../../../../domain/services/local_storage_service.dart';

class ListAssessmentController extends GetxController {
  static ListAssessmentController get to => Get.find();

  RxInt dataOffset = RxInt(1);
  RxInt totalData = RxInt(0);
  RxBool isLoading = RxBool(false);

  // RxBool isLoadMore = RxBool(true);
  bool get isLoadMore =>
      assessmentList.length != totalData.value && isLoading.value == false;
  RxList<Assessment> assessmentList = RxList.empty();

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
    }
  }
}