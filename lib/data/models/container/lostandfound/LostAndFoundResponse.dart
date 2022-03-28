// To parse this JSON data, do
//
//     final lostAndFoundResponse = lostAndFoundResponseFromJson(jsonString);

import 'dart:convert';

LostAndFoundResponse lostAndFoundResponseFromJson(String str) => LostAndFoundResponse.fromJson(json.decode(str));

String lostAndFoundResponseToJson(LostAndFoundResponse data) => json.encode(data.toJson());

class LostAndFoundResponse {
  LostAndFoundResponse({
    required this.success,
    required this.data,
  });

  bool success;
  Data data;

  factory LostAndFoundResponse.fromJson(Map<String, dynamic> json) => LostAndFoundResponse(
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
    required this.bookingId,
    required this.vehicleNumber,
    required  this.description,
    required this.dateTime,
    required this.updatedAt,
    required  this.createdAt,
    required this.id,
  });

  int bookingId;
  String vehicleNumber;
  String description;
  DateTime dateTime;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bookingId: json["booking_id"],
    vehicleNumber: json["vehicle_number"],
    description: json["description"],
    dateTime: DateTime.parse(json["date_time"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "vehicle_number": vehicleNumber,
    "description": description,
    "date_time": dateTime.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
