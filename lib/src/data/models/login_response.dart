import 'package:assessment_app/src/domain/entities/auth/login.dart';

class LoginResponse {
  final int? code;
  final bool? status;
  final String? message;
  final Login? data;

  LoginResponse({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Login.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}
