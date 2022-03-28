// To parse this JSON data, do
//
//     final bookingDetailsResponse = bookingDetailsResponseFromJson(jsonString);

import 'dart:convert';

BookingDetailsResponse bookingDetailsResponseFromJson(String str) => BookingDetailsResponse.fromJson(json.decode(str));

String bookingDetailsResponseToJson(BookingDetailsResponse data) => json.encode(data.toJson());

class BookingDetailsResponse {
  BookingDetailsResponse({
    this.success,
    this.msg,
    this.data,
  });

  bool? success;
  String? msg;
  Data? data;

  factory BookingDetailsResponse.fromJson(Map<String, dynamic> json) => BookingDetailsResponse(
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
    this.approvedAt,
    required this.isPaid,
    required this.isFinished,
    required this.createdAt,
    this.updatedAt,
    required this.isExistInRideStatus,
    this.existBookingRideInfo,
    this.existRideInfo,
    required this.currentStatus,
    this.bookingInformation,
    this.vehicleInfo,
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
  DateTime? approvedAt;
  int isPaid;
  int isFinished;
  DateTime createdAt;
  DateTime? updatedAt;
  bool isExistInRideStatus;
  ExistBookingRideInfo? existBookingRideInfo;
  ExistRideInfo? existRideInfo;
  String currentStatus;
  BookingInformation? bookingInformation;
  VehicleInfo? vehicleInfo;

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
    approvedAt: json["approved_at"]==null ? null : DateTime.parse(json["approved_at"]),
    isPaid: json["is_paid"],
    isFinished: json["is_finished"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
    isExistInRideStatus: json["is_exist_in_ride_status"],
    existBookingRideInfo: json["exist_booking_ride_info"]==null ? null : ExistBookingRideInfo.fromJson(json["exist_booking_ride_info"]),
    existRideInfo: json["exist_ride_info"] == null ? null : ExistRideInfo.fromJson(json["exist_ride_info"]),
    currentStatus: json["current_status"],
    bookingInformation: json["booking_information"]==null ? null : BookingInformation.fromJson(json["booking_information"]),
    vehicleInfo: json["vehicle_info"]==null ? null : VehicleInfo.fromJson(json["booking_information"]),
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
    "approved_at": approvedAt?.toIso8601String(),
    "is_paid": isPaid,
    "is_finished": isFinished,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_exist_in_ride_status": isExistInRideStatus,
    "exist_booking_ride_info": existBookingRideInfo?.toJson(),
    "exist_ride_info": existRideInfo?.toJson(),
    "current_status": currentStatus,
    "booking_information": bookingInformation?.toJson(),
    "vehicle_info":vehicleInfo?.toJson()
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
    updatedAt: json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
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

class ExistBookingRideInfo {
  ExistBookingRideInfo({
    required this.id,
    required this.rideId,
    required this.bookingId,
  });

  int id;
  int rideId;
  int bookingId;

  factory ExistBookingRideInfo.fromJson(Map<String, dynamic> json) => ExistBookingRideInfo(
    id: json["id"],
    rideId: json["ride_id"],
    bookingId: json["booking_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ride_id": rideId,
    "booking_id": bookingId,
  };
}

class ExistRideInfo {
  ExistRideInfo({
    required this.id,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.source,
    required this.destination,
    required this.bookedSeat,
    required this.status,
  });

  int id;
  int vehicleId;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String source;
  String destination;
  int bookedSeat;
  int status;

  factory ExistRideInfo.fromJson(Map<String, dynamic> json) => ExistRideInfo(
    id: json["id"],
    vehicleId: json["vehicle_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    startTime: json["start_time"],
    endTime: json["end_time"],
    source: json["source"],
    destination: json["destination"],
    bookedSeat: json["booked_seat"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_id": vehicleId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "start_time": startTime,
    "end_time": endTime,
    "source": source,
    "destination": destination,
    "booked_seat": bookedSeat,
    "status": status,
  };
}

VehicleInfo vehicleInfoFromJson(String str) => VehicleInfo.fromJson(json.decode(str));

String vehicleInfoToJson(VehicleInfo data) => json.encode(data.toJson());

class VehicleInfo {
  VehicleInfo({
    required this.id,
    required this.vehicleNumber,
    required this.servicePartnerId,
    required this.capacity,
    required this.image,
    required this.driverName,
    required this.driverLicenseNumber,
    required this.driverPhone,
    required this.attendantName,
    required this.attendantPhone,
    required this.attendantNric,
    required this.attendantDob,
  });

  int id;
  String vehicleNumber;
  int servicePartnerId;
  int capacity;
  String image;
  String driverName;
  String driverLicenseNumber;
  String driverPhone;
  String attendantName;
  String attendantPhone;
  String attendantNric;
  String attendantDob;

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => VehicleInfo(
    id: json["id"],
    vehicleNumber: json["vehicle_number"],
    servicePartnerId: json["service_partner_id"],
    capacity: json["capacity"],
    image: json["image"],
    driverName: json["driver_name"],
    driverLicenseNumber: json["driver_license_number"],
    driverPhone: json["driver_phone"],
    attendantName: json["attendant_name"],
    attendantPhone: json["attendant_phone"],
    attendantNric: json["attendant_nric"],
    attendantDob: json["attendant_dob"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_number": vehicleNumber,
    "service_partner_id": servicePartnerId,
    "capacity": capacity,
    "image": image,
    "driver_name": driverName,
    "driver_license_number": driverLicenseNumber,
    "driver_phone": driverPhone,
    "attendant_name": attendantName,
    "attendant_phone": attendantPhone,
    "attendant_nric": attendantNric,
    "attendant_dob": attendantDob,
  };
}


