abstract class ApiConst {
  static const baseUrl = 'https://dev-api-lms.apps-madhani.com/v1';
  static const loginUrl = '$baseUrl/login';
  static assessmentListUrl(int offset) =>
      '$baseUrl/assessments?page=$offset&limit=5';
  static const assessmentTestUrl =
      '$baseUrl/assessments/question/:assessment_id';
}
