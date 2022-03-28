import 'dart:convert';

ServicePartnerSignupRequest servicePartnerSignupRequestFromJson(String str) => ServicePartnerSignupRequest.fromJson(json.decode(str));

String servicePartnerSignupRequestToJson(ServicePartnerSignupRequest data) => json.encode(data.toJson());

class ServicePartnerSignupRequest {
  ServicePartnerSignupRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.businessIdentificationNumber,
    required this.contactPersonName,
    required this.contactPersonPosition,
    required this.contactPersonPhone,
    required this.contactPersonNric,
  });

  String name;
  String email;
  String phone;
  String password;
  String address;
  String businessIdentificationNumber;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;
  String contactPersonNric;

  factory ServicePartnerSignupRequest.fromJson(Map<String, dynamic> json) => ServicePartnerSignupRequest(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    address: json["address"],
    businessIdentificationNumber: json["business_identification_number"],
    contactPersonName: json["contact_person_name"],
    contactPersonPosition: json["contact_person_position"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonNric: json["contact_person_NRIC"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "address": address,
    "business_identification_number": businessIdentificationNumber,
    "contact_person_name": contactPersonName,
    "contact_person_position": contactPersonPosition,
    "contact_person_phone": contactPersonPhone,
    "contact_person_NRIC": contactPersonNric,
  };
}