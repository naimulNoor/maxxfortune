import 'dart:convert';

String driverProfileResponseToJson(DriverProfileResponse data) => json.encode(data.toJson());

class DriverProfileResponse {
  DriverProfileResponse({
    this.data,
  });

  Data? data;

  factory DriverProfileResponse.fromJson(Map<String, dynamic> json) => DriverProfileResponse(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.vehicleNumber,
    required this.servicePartnerId,
    required this.capacity,
    required this.image,
    required this.password,
    required this.driverName,
    required this.driverLicenseNumber,
    required this.driverPhone,
    required this.driverLicenseValidity,
    required this.attendantName,
    required this.attendantPhone,
    required this.attendantNric,
    required this.attendantDob,
    required this.status,
    required this.isVerified,
    this.approvedDate,
    required this.createdAt,
    required this.updatedAt,
    //required this.availableStatus,
  });

  int id;
  String vehicleNumber;
  int servicePartnerId;
  String capacity;
  String image;
  String password;
  String driverName;
  String driverLicenseNumber;
  String driverPhone;
  DateTime driverLicenseValidity;
  String attendantName;
  String attendantPhone;
  String attendantNric;
  DateTime attendantDob;
  int status;
  int isVerified;
  dynamic approvedDate;
  DateTime createdAt;
  DateTime updatedAt;
 // String availableStatus;

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        id: json["id"],
        vehicleNumber: json["vehicle_number"],
        servicePartnerId: json["service_partner_id"],
        capacity: json["capacity"],
        image: json["image"],
        password: json["password"],
        driverName: json["driver_name"],
        driverLicenseNumber: json["driver_license_number"],
        driverPhone: json["driver_phone"],
        driverLicenseValidity: DateTime.parse(json["driver_license_validity"]),
        attendantName: json["attendant_name"],
        attendantPhone: json["attendant_phone"],
        attendantNric: json["attendant_nric"],
        attendantDob: DateTime.parse(json["attendant_dob"]),
        status: json["status"],
        isVerified: json["is_verified"],
        approvedDate: json["approved_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        //availableStatus: json["available_status"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "vehicle_number": vehicleNumber,
        "service_partner_id": servicePartnerId,
        "capacity": capacity,
        "image": image,
        "password": password,
        "driver_name": driverName,
        "driver_license_number": driverLicenseNumber,
        "driver_phone": driverPhone,
        "driver_license_validity": "${driverLicenseValidity.year.toString()
            .padLeft(4, '0')}-${driverLicenseValidity.month.toString().padLeft(
            2, '0')}-${driverLicenseValidity.day.toString().padLeft(2, '0')}",
        "attendant_name": attendantName,
        "attendant_phone": attendantPhone,
        "attendant_nric": attendantNric,
        "attendant_dob": "${attendantDob.year.toString().padLeft(
            4, '0')}-${attendantDob.month.toString().padLeft(
            2, '0')}-${attendantDob.day.toString().padLeft(2, '0')}",
        "status": status,
        "is_verified": isVerified,
        "approved_date": approvedDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        //"available_status": availableStatus,
      };
}