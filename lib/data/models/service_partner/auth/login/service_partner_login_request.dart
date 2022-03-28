import 'dart:convert';

ServicePartnerLoginRequest servicePartnerLoginRequestFromJson(String str) => ServicePartnerLoginRequest.fromJson(json.decode(str));

String servicePartnerLoginRequestToJson(ServicePartnerLoginRequest data) => json.encode(data.toJson());

class ServicePartnerLoginRequest {
  ServicePartnerLoginRequest({
    required this.email,
    required this.password,
    this.deviceToken,
  });

  String email;
  String password;
  String? deviceToken;

  factory ServicePartnerLoginRequest.fromJson(Map<String, dynamic> json) => ServicePartnerLoginRequest(
    email: json["email"],
    password: json["password"],
    deviceToken: json["device_token"]
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "device_token": deviceToken,
  };
}