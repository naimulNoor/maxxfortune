import 'dart:convert';

DriverLoginRequest driverLoginRequestFromJson(String str) => DriverLoginRequest.fromJson(json.decode(str));

String driverLoginRequestToJson(DriverLoginRequest data) => json.encode(data.toJson());

class DriverLoginRequest {
  DriverLoginRequest({
    required this.vehicleNumber,
    required this.password,
    this.deviceToken,
  });

  String vehicleNumber;
  String password;
  String? deviceToken;

  factory DriverLoginRequest.fromJson(Map<String, dynamic> json) => DriverLoginRequest(
    vehicleNumber: json["vehicle_number"],
    password: json["password"],
    deviceToken: json["device_token"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_number": vehicleNumber,
    "password": password,
    "device_token":deviceToken,
  };
}