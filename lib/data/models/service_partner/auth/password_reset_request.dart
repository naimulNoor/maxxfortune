import 'dart:convert';

PasswordResetRequest passwordResetRequestFromJson(String str) => PasswordResetRequest.fromJson(json.decode(str));

String passwordResetRequestToJson(PasswordResetRequest data) => json.encode(data.toJson());

class PasswordResetRequest {
  PasswordResetRequest({
    required this.code,
    required this.password,
  });

  String code;
  String password;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) => PasswordResetRequest(
    code: json["code"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "password": password,
  };
}
