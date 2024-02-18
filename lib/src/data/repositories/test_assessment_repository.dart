import 'package:assessment_app/configs/constants/api_const.dart';
import 'package:assessment_app/src/domain/services/global_dio.dart';
import 'package:dio/dio.dart';

import '../models/test_assessment_response.dart';

class TestAssessmentRepository {
  static Future<TestAssessmentResponse?> fetchTest({
    String assessmentId = '',
  }) async {
    final response =
        await globalDio.get(ApiConst.assessmentTestUrl(assessmentId));
    try {
      if (response.statusCode == 200) {
        return TestAssessmentResponse.fromJson(response.data);
      } else {
        return TestAssessmentResponse(
          status: false,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return TestAssessmentResponse(
          status: false,
          message: 'Connection Error',
        );
      } else {
        return TestAssessmentResponse(
          status: false,
          message: 'Server Err',
        );
      }
    }
  }
}
