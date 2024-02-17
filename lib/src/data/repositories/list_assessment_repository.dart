import 'dart:convert';
import 'dart:developer';

import 'package:assessment_app/configs/constants/api_const.dart';
import 'package:assessment_app/src/domain/services/global_dio.dart';
import 'package:assessment_app/src/domain/services/local_storage_service.dart';
import 'package:dio/dio.dart';

import '../models/list_assessment_response.dart';

class ListAssessmentRepository {
  static Future<ListAssessmentResponse?> fetchAssessments({
    int dataOffset = 1,
  }) async {
    try {
      final response =
          await globalDio.get(ApiConst.assessmentListUrl(dataOffset));

      if (response.statusCode == 200) {
        return ListAssessmentResponse.fromJson(response.data);
      } else {
        return ListAssessmentResponse(
          status: false,
          message: response.data["message"],
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        return ListAssessmentResponse(
          status: false,
          message: 'Connection Error',
        );
      } else {
        return ListAssessmentResponse(
          status: false,
          message: 'Server Err',
        );
      }
    }
  }
}
