import 'dart:convert';

PasswordResetCodeRequest passwordResetCodeRequestFromJson(String str) => PasswordResetCodeRequest.fromJson(json.decode(str));

String passwordResetCodeRequestToJson(PasswordResetCodeRequest data) => json.encode(data.toJson());

class PasswordResetCodeRequest {
  PasswordResetCodeRequest({
    required this.email,
  });

  String email;

  factory PasswordResetCodeRequest.fromJson(Map<String, dynamic> json) => PasswordResetCodeRequest(
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
  };
}
