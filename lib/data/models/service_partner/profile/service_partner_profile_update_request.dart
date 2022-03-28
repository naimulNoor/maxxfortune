import 'dart:convert';

ServicePartnerProfileUpdateRequest servicePartnerProfileUpdateRequestFromJson(String str) => ServicePartnerProfileUpdateRequest.fromJson(json.decode(str));

String servicePartnerProfileUpdateRequestToJson(ServicePartnerProfileUpdateRequest data) => json.encode(data.toJson());

class ServicePartnerProfileUpdateRequest {
  ServicePartnerProfileUpdateRequest({
    required this.name,
    required this.email,
    required this.phone,
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
  String address;
  String businessIdentificationNumber;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;
  String contactPersonNric;

  factory ServicePartnerProfileUpdateRequest.fromJson(Map<String, dynamic> json) => ServicePartnerProfileUpdateRequest(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
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
    "address": address,
    "business_identification_number": businessIdentificationNumber,
    "contact_person_name": contactPersonName,
    "contact_person_position": contactPersonPosition,
    "contact_person_phone": contactPersonPhone,
    "contact_person_NRIC": contactPersonNric,
  };
}