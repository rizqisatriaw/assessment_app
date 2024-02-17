import 'assessment.dart';

class ListAssessment {
  final int? code;
  final bool? status;
  final int? page;
  final int? count;
  final int? totalData;
  final String? message;
  final List<Assessment>? data;

  ListAssessment({
    this.code,
    this.status,
    this.page,
    this.count,
    this.totalData,
    this.message,
    this.data,
  });
}
