// To parse this JSON data, do
//
//     final bookingRequest = bookingRequestFromJson(jsonString);

import 'dart:convert';

BookingRequest bookingRequestFromJson(String str) => BookingRequest.fromJson(json.decode(str));

String bookingRequestToJson(BookingRequest data) => json.encode(data.toJson());

class BookingRequest {
  BookingRequest({
    required this.startDate,
    required this.endDate,
    required this.pickupTime,
    required this.dropoffTime,
    required this.newChilds,
    required this.existingChilds,
    required this.numberOfDays,
    required this.bookedSeat,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.pickupLongitude,
    required this.pickupLatitude,
    required this.pickupPostalCode,
    required this.dropoffLongitude,
    required this.dropoffLatitude,
    required this.dropoffPostalCode,
    required this.pickupRemarks,
    required this.dropoffRemarks,
    required this.distance,
    required this.price,
    required this.verbatim,
    required this.comment,
  });

  DateTime startDate;
  DateTime endDate;
  String pickupTime;
  String dropoffTime;
  List<String> newChilds;
  List<int> existingChilds;
  int numberOfDays;
  int bookedSeat;
  String pickupAddress;
  String dropoffAddress;
  String pickupLongitude;
  String pickupLatitude;
  String pickupPostalCode;
  String dropoffLongitude;
  String dropoffLatitude;
  String dropoffPostalCode;
  String pickupRemarks;
  String dropoffRemarks;
  double distance;
  double price;
  String verbatim;
  String? comment;

  factory BookingRequest.fromJson(Map<String, dynamic> json) => BookingRequest(
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    pickupTime: json["pickup_time"],
    dropoffTime: json["dropoff_time"],
    newChilds: List<String>.from(json["new_childs"].map((x) => x)),
    existingChilds: List<int>.from(json["existing_childs"].map((x) => x)),
    numberOfDays: json["number_of_days"],
    bookedSeat: json["booked_seat"],
    pickupAddress: json["pickup_address"],
    dropoffAddress: json["dropoff_address"],
    pickupLongitude: json["pickup_longitude"],
    pickupLatitude: json["pickup_latitude"],
    pickupPostalCode: json["pickup_postal_code"],
    dropoffLongitude: json["dropoff_longitude"],
    dropoffLatitude: json["dropoff_latitude"],
    dropoffPostalCode: json["dropoff_postal_code"],
    pickupRemarks: json["pickup_remarks"],
    dropoffRemarks: json["dropoff_remarks"],
    distance: json["distance"],
    price: json["price"],
    verbatim: json["verbatim"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "dropoff_time": dropoffTime,
    "new_childs": List<dynamic>.from(newChilds.map((x) => x)),
    "existing_childs": List<dynamic>.from(existingChilds.map((x) => x)),
    "number_of_days": numberOfDays,
    "booked_seat": bookedSeat,
    "pickup_address": pickupAddress,
    "dropoff_address": dropoffAddress,
    "pickup_longitude": pickupLongitude,
    "pickup_latitude": pickupLatitude,
    "pickup_postal_code": pickupPostalCode,
    "dropoff_longitude": dropoffLongitude,
    "dropoff_latitude": dropoffLatitude,
    "dropoff_postal_code": dropoffPostalCode,
    "pickup_remarks": pickupRemarks,
    "dropoff_remarks": dropoffRemarks,
    "distance": distance,
    "price": price,
    "verbatim": verbatim,
    "comment": comment
  };
}