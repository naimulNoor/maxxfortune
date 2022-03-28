import 'dart:convert';

ServicePartnerLoginResponse servicePartnerLoginResponseFromJson(String str) => ServicePartnerLoginResponse.fromJson(json.decode(str));

String servicePartnerLoginResponseToJson(ServicePartnerLoginResponse data) => json.encode(data.toJson());

class ServicePartnerLoginResponse {
  ServicePartnerLoginResponse({
    required this.message,
    this.data,
  });

  String message;
  Data? data;

  factory ServicePartnerLoginResponse.fromJson(Map<String, dynamic> json) => ServicePartnerLoginResponse(
    message: json["message"],
    data: json["data"]==null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.servicePartner,
    required this.token,
  });

  ServicePartner servicePartner;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    servicePartner: ServicePartner.fromJson(json["service_partner"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "service_partner": servicePartner.toJson(),
    "token": token,
  };
}

class ServicePartner {
  ServicePartner({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.address,
    required this.businessIdentificationNumber,
    required this.contactPersonName,
    required this.contactPersonPosition,
    required this.contactPersonPhone,
    required this.contactPersonNRIC,
    required this.status,
    this.approvedDate,
    required this.createdAt,
    this.updatedAt,
    this.lastLogin,
  });

  int id;
  String name;
  String phone;
  String email;
  String password;
  String image;
  String address;
  String businessIdentificationNumber;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;
  String contactPersonNRIC;
  String status;
  DateTime? approvedDate;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? lastLogin;

  factory ServicePartner.fromJson(Map<String, dynamic> json) => ServicePartner(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
    address: json["address"],
    businessIdentificationNumber: json["business_identification_number"],
    contactPersonName: json["contact_person_name"],
    contactPersonPosition: json["contact_person_position"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonNRIC: json["contact_person_NRIC"],
    status: json["status"],
    approvedDate: json["approved_date"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    lastLogin: DateTime.parse(json["last_login"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "image": image,
    "address": address,
    "business_identification_number": businessIdentificationNumber,
    "contact_person_name": contactPersonName,
    "contact_person_position": contactPersonPosition,
    "contact_person_phone": contactPersonPhone,
    "contact_person_NRIC": contactPersonNRIC,
    "status": status,
    "approved_date": approvedDate?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "last_login": lastLogin?.toIso8601String(),
  };
}
