import 'dart:convert';

import 'package:logger/logger.dart';

MyBookingListResponse myBookingListResponseFromJson(String str) => MyBookingListResponse.fromJson(json.decode(str));

String myBookingListResponseToJson(MyBookingListResponse data) => json.encode(data.toJson());

class MyBookingListResponse {
  MyBookingListResponse({
    required this.success,
    this.data,
  });

  bool success;
  Data? data;

  factory MyBookingListResponse.fromJson(Map<String, dynamic> json) => MyBookingListResponse(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
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
    this.dateOfBirth,
    this.emailVerifiedAt,
    required this.createdAt,
    this.updatedAt,
    this.image,
    this.nric,
    this.caretakerName,
    this.caretakerAddress,
    this.caretakerImage,
    this.caretakerPhone,
    required this.bookings,
  });

  int id;
  String? name;
  String? email;
  String? phone;
  String? address;
  DateTime? dateOfBirth;
  DateTime? emailVerifiedAt;
  DateTime createdAt;
  DateTime? updatedAt;
  String? image;
  String? nric;
  String? caretakerName;
  String? caretakerAddress;
  String? caretakerImage;
  String? caretakerPhone;
  List<Booking> bookings;

  factory Data.fromJson(Map<String, dynamic> json){
      return Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        dateOfBirth: json["date_of_birth"]==null ? null : DateTime.parse(json["date_of_birth"]),
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        image: json["image"],
        nric: json["nric"],
        caretakerName: json["caretaker_name"],
        caretakerAddress: json["caretaker_address"],
        caretakerImage: json["caretaker_image"],
        caretakerPhone: json["caretaker_phone"],
        bookings: List<Booking>.from(
            json["bookings"].map((x) => Booking.fromJson(x))),
      );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "date_of_birth": "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image,
    "nric": nric,
    "caretaker_name": caretakerName,
    "caretaker_address": caretakerAddress,
    "caretaker_image": caretakerImage,
    "caretaker_phone": caretakerPhone,
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class Booking {
  Booking({
    required this.id,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.pickupTime,
    required this.dropoffTime,
    required this.numberOfDays,
    required this.bookedSeat,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.price,
    required this.distance,
    this.rating,
    required this.isApproved,
    required this.isPaid,
    required this.isFinished,
    required this.createdAt,
    this.updatedAt,
    required this.currentStatus,
    required this.comment,
  });

  int id;
  int userId;
  DateTime startDate;
  DateTime endDate;
  String pickupTime;
  String dropoffTime;
  int numberOfDays;
  int bookedSeat;
  String pickupAddress;
  String dropoffAddress;
  double? price;
  double? distance;
  String? rating;
  int isApproved;
  int isPaid;
  int isFinished;
  DateTime createdAt;
  DateTime? updatedAt;
  String currentStatus;
  String? comment;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    userId: json["user_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    pickupTime: json["pickup_time"],
    dropoffTime: json["dropoff_time"],
    numberOfDays: json["number_of_days"],
    bookedSeat: json["booked_seat"],
    pickupAddress: json["pickup_address"],
    dropoffAddress: json["dropoff_address"],
    price: json["price"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    rating: json["rating"],
    isApproved: json["is_approved"],
    isPaid: json["is_paid"],
    isFinished: json["is_finished"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    currentStatus: json["current_status"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "dropoff_time": dropoffTime,
    "number_of_days": numberOfDays,
    "booked_seat": bookedSeat,
    "pickup_address": pickupAddress,
    "dropoff_address": dropoffAddress,
    "price": price,
    "distance": distance,
    "rating": rating,
    "is_approved": isApproved,
    "is_paid": isPaid,
    "is_finished": isFinished,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "current_status": currentStatus,
    "comment": comment,
  };
}