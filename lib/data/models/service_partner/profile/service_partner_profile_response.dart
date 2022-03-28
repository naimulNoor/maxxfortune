import 'dart:convert';

ServicePartnerProfileResponse servicePartnerProfileResponseFromJson(String str) => ServicePartnerProfileResponse.fromJson(json.decode(str));

String servicePartnerProfileResponseToJson(ServicePartnerProfileResponse data) => json.encode(data.toJson());

class ServicePartnerProfileResponse {
  ServicePartnerProfileResponse({
    this.data,
    this.message,
  });

  Data? data;
  String? message;

  factory ServicePartnerProfileResponse.fromJson(Map<String, dynamic> json) => ServicePartnerProfileResponse(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg" : message,
  };
}

class Data {
  Data({
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
    required this.contactPersonNric,
    required this.status,
    required this.approvedDate,
    required this.createdAt,
    required this.updatedAt,
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
  String contactPersonNric;
  String status;
  DateTime? approvedDate;
  DateTime createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    contactPersonNric: json["contact_person_NRIC"],
    status: json["status"],
    approvedDate: json["approved_date"] == null ? null : DateTime.parse(json["approved_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "contact_person_NRIC": contactPersonNric,
    "status": status,
    "approved_date": approvedDate?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
