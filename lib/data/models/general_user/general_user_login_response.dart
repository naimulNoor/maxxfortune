import 'dart:convert';

GeneralUserLoginResponse generalUserLoginResponseFromJson(String str) => GeneralUserLoginResponse.fromJson(json.decode(str));

String generalUserLoginResponseToJson(GeneralUserLoginResponse data) => json.encode(data.toJson());

class GeneralUserLoginResponse {
  GeneralUserLoginResponse({
    required this.msg,
    this.data,
  });

  String msg;
  Data? data;

  factory GeneralUserLoginResponse.fromJson(Map<String, dynamic> json) => GeneralUserLoginResponse(
    msg: json["msg"],
    data: json["data"]==null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.dateOfBirth,
    this.emailVerifiedAt,
    required this.createdAt,
    this.updatedAt,
    this.image,
    this.nric,
    this.caretakerName,
    this.caretakerAddress,
    this.caretakerImage,
    this.lastLogin,
  });

  int id;
  String name;
  String email;
  String phone;
  String address;
  DateTime? dateOfBirth;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime? updatedAt;
  String? image;
  String? nric;
  String? caretakerName;
  String? caretakerAddress;
  String? caretakerImage;
  DateTime? lastLogin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    dateOfBirth: json["date_of_birth"]==null ? null : DateTime.parse(json["date_of_birth"]),
    emailVerifiedAt: json["email_verified_at"]==null ? null :  DateTime.parse(json["email_verified_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
    image: json["image"],
    nric: json["nric"],
    caretakerName: json["caretaker_name"],
    caretakerAddress: json["caretaker_address"],
    caretakerImage: json["caretaker_image"],
    lastLogin: json["last_login"]==null ? null : DateTime.parse(json["last_login"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "date_of_birth": dateOfBirth?.toIso8601String(),
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image,
    "nric": nric,
    "caretaker_name": caretakerName,
    "caretaker_address": caretakerAddress,
    "caretaker_image": caretakerImage,
    "last_login": lastLogin?.toIso8601String(),
  };
}