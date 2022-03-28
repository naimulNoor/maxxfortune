import 'dart:convert';

DriverPasswordResetRequest driverPasswordResetRequestFromJson(String str) => DriverPasswordResetRequest.fromJson(json.decode(str));

String driverPasswordResetRequestToJson(DriverPasswordResetRequest data) => json.encode(data.toJson());

class DriverPasswordResetRequest {
  DriverPasswordResetRequest({
    required this.resetCode,
    required this.password,
  });

  String resetCode;
  String password;

  factory DriverPasswordResetRequest.fromJson(Map<String, dynamic> json) => DriverPasswordResetRequest(
    resetCode: json["reset_code"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "reset_code": resetCode,
    "password": password,
  };
}