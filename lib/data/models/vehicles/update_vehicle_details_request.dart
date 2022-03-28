import 'dart:convert';

UpdateVehicleDetailsRequest updateVehicleDetailsRequestFromJson(String str) => UpdateVehicleDetailsRequest.fromJson(json.decode(str));

String updateVehicleDetailsRequestToJson(UpdateVehicleDetailsRequest data) => json.encode(data.toJson());

class UpdateVehicleDetailsRequest {
  UpdateVehicleDetailsRequest({
    required this.driverName,
    required this.driverLicenseNumber,
    required this.driverPhone,
    required this.driverLicenseValidity,
    required this.attendantName,
    required this.attendantPhone,
    required this.attendantNric,
    required this.attendantDob,
    required this.id,
  });

  String driverName;
  String driverLicenseNumber;
  String driverPhone;
  String driverLicenseValidity;
  String attendantName;
  String attendantPhone;
  String attendantNric;
  String attendantDob;
  int id;

  factory UpdateVehicleDetailsRequest.fromJson(Map<String, dynamic> json) => UpdateVehicleDetailsRequest(
    driverName: json["driver_name"],
    driverLicenseNumber: json["driver_license_number"],
    driverPhone: json["driver_phone"],
    driverLicenseValidity: json["driver_license_validity"],
    attendantName: json["attendant_name"],
    attendantPhone: json["attendant_phone"],
    attendantNric: json["attendant_nric"],
    attendantDob: json["attendant_dob"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "driver_name": driverName,
    "driver_license_number": driverLicenseNumber,
    "driver_phone": driverPhone,
    "driver_license_validity": driverLicenseValidity,
    "attendant_name": attendantName,
    "attendant_phone": attendantPhone,
    "attendant_nric": attendantNric,
    "attendant_dob": attendantDob,
    "id": id,
  };
}