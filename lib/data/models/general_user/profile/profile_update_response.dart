import 'dart:convert';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

class UpdateProfileResponse {
  UpdateProfileResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool? success;
  String msg;
  Data? data;

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => UpdateProfileResponse(
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
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.dateOfBirth,
    this.emailVerifiedAt,
    required this.createdAt,
    this.updatedAt,
    this.image,
    required  this.nric,
    required this.caretakerName,
    required this.caretakerAddress,
    this.caretakerImage,
    this.caretakerPhone,
  });

  int id;
  String name;
  String email;
  String phone;
  String address;
  DateTime dateOfBirth;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime? updatedAt;
  String? image;
  String nric;
  String caretakerName;
  String caretakerAddress;
  String? caretakerImage;
  String? caretakerPhone;


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    emailVerifiedAt:json["email_verified_at"]==null ? null : DateTime.parse(json["email_verified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt:json["updated_at"]==null ? null :  DateTime.parse(json["updated_at"]),
    image: json["image"],
    nric: json["nric"],
    caretakerName: json["caretaker_name"],
    caretakerAddress: json["caretaker_address"],
    caretakerImage: json["caretaker_image"],
    caretakerPhone: json["caretaker_phone"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image,
    "nric": nric,
    "caretaker_name": caretakerName,
    "caretaker_address": caretakerAddress,
    "caretaker_image": caretakerImage,
    "caretaker_phone":caretakerPhone
  };
}
