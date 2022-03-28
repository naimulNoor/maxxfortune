import 'dart:convert';

InvoiceResponse bookingResponseFromJson(String str) => InvoiceResponse.fromJson(json.decode(str));

String bookingResponseToJson(InvoiceResponse data) => json.encode(data.toJson());

class InvoiceResponse {
  InvoiceResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool success;
  String msg;
  Data? data;

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => InvoiceResponse(
    success: json["success"],
    msg: json["msg"],
    data:json["data"]==null ? null :  Data.fromJson(json["data"]),
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
    this.bookingInformation,
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
  int? rating;
  int isApproved;
  int isPaid;
  int isFinished;
  DateTime createdAt;
  DateTime? updatedAt;
  BookingInformation? bookingInformation;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    updatedAt:json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
    bookingInformation: json["booking_information"]==null ? null : BookingInformation.fromJson(json["booking_information"]),
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
    "booking_information": bookingInformation?.toJson(),
  };
}

class BookingInformation {
  BookingInformation({
    required this.id,
    required this.bookingId,
    required this.pickupLongitude,
    required this.pickupLatitude,
    required this.pickupPostalCode,
    required this.dropoffLongitude,
    required this.dropoffLatitude,
    required this.dropoffPostalCode,
    this.pickupRemarks,
    this.dropoffRemarks,
    this.verbatim,
    required this.createdAt,
    this.updatedAt,
  });

  int id;
  int bookingId;
  String pickupLongitude;
  String pickupLatitude;
  String pickupPostalCode;
  String dropoffLongitude;
  String dropoffLatitude;
  String dropoffPostalCode;
  String? pickupRemarks;
  String? dropoffRemarks;
  String? verbatim;
  DateTime createdAt;
  DateTime? updatedAt;

  factory BookingInformation.fromJson(Map<String, dynamic> json) => BookingInformation(
    id: json["id"],
    bookingId: json["booking_id"],
    pickupLongitude: json["pickup_longitude"],
    pickupLatitude: json["pickup_latitude"],
    pickupPostalCode: json["pickup_postal_code"],
    dropoffLongitude: json["dropoff_longitude"],
    dropoffLatitude: json["dropoff_latitude"],
    dropoffPostalCode: json["dropoff_postal_code"],
    pickupRemarks: json["pickup_remarks"],
    dropoffRemarks: json["dropoff_remarks"],
    verbatim: json["verbatim"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "pickup_longitude": pickupLongitude,
    "pickup_latitude": pickupLatitude,
    "pickup_postal_code": pickupPostalCode,
    "dropoff_longitude": dropoffLongitude,
    "dropoff_latitude": dropoffLatitude,
    "dropoff_postal_code": dropoffPostalCode,
    "pickup_remarks": pickupRemarks,
    "dropoff_remarks": dropoffRemarks,
    "verbatim": verbatim,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
