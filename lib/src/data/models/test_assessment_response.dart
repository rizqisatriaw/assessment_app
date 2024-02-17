import 'package:assessment_app/src/domain/entities/test_assessment/test_assessment.dart';

class TestAssessmentResponse {
  final int? code;
  final bool? status;
  final String? message;
  final TestAssessment? data;

  TestAssessmentResponse({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory TestAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      TestAssessmentResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : TestAssessment.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
