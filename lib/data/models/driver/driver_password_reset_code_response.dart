import 'dart:convert';

DriverPasswordResetCodeResponse driverPasswordResetCodeResponseFromJson(String str) => DriverPasswordResetCodeResponse.fromJson(json.decode(str));

String driverPasswordResetCodeResponseToJson(DriverPasswordResetCodeResponse data) => json.encode(data.toJson());

class DriverPasswordResetCodeResponse {
  DriverPasswordResetCodeResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory DriverPasswordResetCodeResponse.fromJson(Map<String, dynamic> json) => DriverPasswordResetCodeResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}