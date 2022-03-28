import 'dart:convert';

SpResetVehicleLoginResponse spResetVehicleLoginResponseFromJson(String str) => SpResetVehicleLoginResponse.fromJson(json.decode(str));

String spResetVehicleLoginResponseToJson(SpResetVehicleLoginResponse data) => json.encode(data.toJson());

class SpResetVehicleLoginResponse {
  SpResetVehicleLoginResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory SpResetVehicleLoginResponse.fromJson(Map<String, dynamic> json) => SpResetVehicleLoginResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}