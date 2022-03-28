import 'dart:convert';

ChildListResponse childListResponseFromJson(String str) => ChildListResponse.fromJson(json.decode(str));

String childListResponseToJson(ChildListResponse data) => json.encode(data.toJson());

class ChildListResponse {
  ChildListResponse({
    required this.success,
    required this.msg,
    required this.data,
  });

  bool success;
  String msg;
  List<Datum> data;

  factory ChildListResponse.fromJson(Map<String, dynamic> json) => ChildListResponse(
    success: json["success"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.ride,
    this.bookingTravelId,
    this.bookingId,
    this.isFinished,
    required this.children,
  });

  Ride? ride;
  int? bookingTravelId;
  int? bookingId;
  int? isFinished;
  List<Child> children;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    ride: json["ride"] == null ? null : Ride.fromJson(json["ride"]),
    bookingTravelId: json["booking_travel_id"],
    bookingId: json["booking_id"],
    isFinished: json["is_finished"],
    children: List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ride": ride?.toJson(),
    "booking_travel_id": bookingTravelId,
    "booking_id": bookingId,
    "is_finished": isFinished,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    required this.id,
    required this.userId,
    required this.name,
  });

  int id;
  int userId;
  String name;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
  };
}

class Ride {
  Ride({
    required this.id,
    required this.name,
    required this.vehicleId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required  this.source,
    required this.destination,
    required this.bookedSeat,
    required  this.status,
  });

  int id;
  String name;
  int vehicleId;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  String source;
  String destination;
  int bookedSeat;
  int status;

  factory Ride.fromJson(Map<String, dynamic> json) => Ride(
    id: json["id"],
    name: json["name"],
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
    "name": name,
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