import 'dart:convert';

ServicePartnerSignupResponse servicePartnerSignupResponseFromJson(String str) => ServicePartnerSignupResponse.fromJson(json.decode(str));

String servicePartnerSignupResponseToJson(ServicePartnerSignupResponse data) => json.encode(data.toJson());

class ServicePartnerSignupResponse {
  ServicePartnerSignupResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool success;
  String msg;
  Data? data;

  factory ServicePartnerSignupResponse.fromJson(Map<String, dynamic> json) => ServicePartnerSignupResponse(
    success: json["success"],
    msg: json["msg"],
    data:json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.password,
    required this.address,
    required this.businessIdentificationNumber,
    required this.contactPersonName,
    required this.contactPersonPosition,
    required this.contactPersonPhone,
    required this.contactPersonNRIC,
    this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phone;
  String email;
  String image;
  String password;
  String address;
  String businessIdentificationNumber;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;
  String contactPersonNRIC;
  DateTime? updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    password: json["password"],
    address: json["address"],
    businessIdentificationNumber: json["business_identification_number"],
    contactPersonName: json["contact_person_name"],
    contactPersonPosition: json["contact_person_position"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonNRIC: json["contact_person_NRIC"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "image": image,
    "password": password,
    "address": address,
    "business_identification_number": businessIdentificationNumber,
    "contact_person_name": contactPersonName,
    "contact_person_position": contactPersonPosition,
    "contact_person_phone": contactPersonPhone,
    "contact_person_NRIC": contactPersonNRIC,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
