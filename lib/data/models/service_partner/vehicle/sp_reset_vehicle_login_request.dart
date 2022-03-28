import 'dart:convert';

SpResetVehicleLoginRequest spResetVehicleLoginRequestFromJson(String str) => SpResetVehicleLoginRequest.fromJson(json.decode(str));

String spResetVehicleLoginRequestToJson(SpResetVehicleLoginRequest data) => json.encode(data.toJson());

class SpResetVehicleLoginRequest {
  SpResetVehicleLoginRequest({
    required this.servicePartnerPassword,
    required this.password,
    required this.vehicleId,
  });

  String servicePartnerPassword;
  String password;
  int vehicleId;

  factory SpResetVehicleLoginRequest.fromJson(Map<String, dynamic> json) => SpResetVehicleLoginRequest(
    servicePartnerPassword: json["service_partner_password"],
    password: json["password"],
    vehicleId: json["vehicle_id"],
  );

  Map<String, dynamic> toJson() => {
    "service_partner_password": servicePartnerPassword,
    "password": password,
    "vehicle_id": vehicleId,
  };
}
