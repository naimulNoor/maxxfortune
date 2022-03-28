import 'dart:convert';

DriverPasswordResetResponse driverPasswordResetResponseFromJson(String str) => DriverPasswordResetResponse.fromJson(json.decode(str));

String driverPasswordResetResponseToJson(DriverPasswordResetResponse data) => json.encode(data.toJson());

class DriverPasswordResetResponse {
  DriverPasswordResetResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory DriverPasswordResetResponse.fromJson(Map<String, dynamic> json) => DriverPasswordResetResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}