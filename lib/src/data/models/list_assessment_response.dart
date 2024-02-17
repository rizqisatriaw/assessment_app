import '../../domain/entities/list_assessment/assessment.dart';

class ListAssessmentResponse {
  final int? code;
  final bool? status;
  final int? page;
  final int? count;
  final int? totalData;
  final String? message;
  final List<Assessment>? data;

  ListAssessmentResponse({
    this.code,
    this.status,
    this.page,
    this.count,
    this.totalData,
    this.message,
    this.data,
  });

  factory ListAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      ListAssessmentResponse(
        code: json["code"],
        status: json["status"],
        page: json["page"],
        count: json["count"],
        totalData: json["total_data"],
        message: json["message"],
        data: json["data"] != null
            ? List<Assessment>.from(
                json["data"]!.map((x) => Assessment.fromJson(x)))
            : [],
      );
}
