import 'dart:convert';

UpdateProfileRequest updateProfileRequestFromJson(String str) => UpdateProfileRequest.fromJson(json.decode(str));

String updateProfileRequestToJson(UpdateProfileRequest data) => json.encode(data.toJson());

class UpdateProfileRequest {
  UpdateProfileRequest({
    required this.name,
    required this.address,
    required this.phone,
    required this.nric,
    required this.dateOfBirth,
    required this.caretakerName,
    required this.caretakerAddress,
    required this.caretakerPhone
  });

  String name;
  String address;
  String phone;
  String nric;
  DateTime dateOfBirth;
  String caretakerName;
  String caretakerAddress;
  String? caretakerPhone;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) => UpdateProfileRequest(
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    nric: json["nric"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    caretakerName: json["caretaker_name"],
    caretakerAddress: json["caretaker_address"],
    caretakerPhone : json["caretaker_phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phone": phone,
    "nric": nric,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "caretaker_name": caretakerName,
    "caretaker_address": caretakerAddress,
    "caretaker_phone":caretakerPhone
  };
}