// To parse this JSON data, do
//
//     final contactUsResponse = contactUsResponseFromJson(jsonString);

import 'dart:convert';

ContactUsResponse contactUsResponseFromJson(String str) => ContactUsResponse.fromJson(json.decode(str));

String contactUsResponseToJson(ContactUsResponse data) => json.encode(data.toJson());

class ContactUsResponse {
  ContactUsResponse({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory ContactUsResponse.fromJson(Map<String, dynamic> json) => ContactUsResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.websiteUrl,
    required this.description,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phone;
  String email;
  String address;
  String websiteUrl;
  String description;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    websiteUrl: json["website_url"],
    description: json["description"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "website_url": websiteUrl,
    "description": description,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
