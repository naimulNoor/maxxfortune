import 'dart:convert';

GeneralUserSignupResponse generalUserSignupFromJson(String str) =>
    GeneralUserSignupResponse.fromJson(json.decode(str));

String generalUserSignupToJson(GeneralUserSignupResponse data) =>
    json.encode(data.toJson());

class GeneralUserSignupResponse {
  GeneralUserSignupResponse({
    this.success,
    required this.msg,
    this.data,
  });

  bool? success;
  String msg;
  Data? data;

  factory GeneralUserSignupResponse.fromJson(Map<String, dynamic> json) =>
      GeneralUserSignupResponse(
        success: json["success"],
        msg: json["msg"],
        data: json["data"]==null ? null : Data.fromJson(json["data"]),
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
    required this.address,
    this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String phone;
  String email;
  String address;
  DateTime? updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    address: json["address"],
    updatedAt:json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "address": address,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}