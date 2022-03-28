
import 'dart:convert';

GeneralUserLoginRequest generalUserLoginRequestFromJson(String str) => GeneralUserLoginRequest.fromJson(json.decode(str));

String generalUserLoginRequestToJson(GeneralUserLoginRequest data) => json.encode(data.toJson());

class GeneralUserLoginRequest {
  GeneralUserLoginRequest({
    required this.email,
    required this.password,
    this.deviceToken,
  });

  String email;
  String password;
  String? deviceToken;

  factory GeneralUserLoginRequest.fromJson(Map<String, dynamic> json) => GeneralUserLoginRequest(
    email: json["email"],
    password: json["password"],
    deviceToken: json["device_token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_token":deviceToken,
  };
}