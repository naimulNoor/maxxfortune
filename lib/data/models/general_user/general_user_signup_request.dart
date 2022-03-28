import 'dart:convert';

GeneralUserSignupRequest generalUserSignupRequestFromJson(String str) =>
    GeneralUserSignupRequest.fromJson(json.decode(str));

String generalUserSignupRequestToJson(GeneralUserSignupRequest data) =>
    json.encode(data.toJson());

class GeneralUserSignupRequest {
  GeneralUserSignupRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
  });

  String name;
  String email;
  String phone;
  String password;
  String address;

  factory GeneralUserSignupRequest.fromJson(Map<String, dynamic> json) =>
      GeneralUserSignupRequest(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "address": address,
  };
}