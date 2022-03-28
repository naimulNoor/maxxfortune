import 'dart:convert';

ChildListUpdateResponse childListUpdateResponseFromJson(String str) => ChildListUpdateResponse.fromJson(json.decode(str));

String childListUpdateResponseToJson(ChildListUpdateResponse data) => json.encode(data.toJson());

class ChildListUpdateResponse {
  ChildListUpdateResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool success;
  String msg;
  Data? data;

  factory ChildListUpdateResponse.fromJson(Map<String, dynamic> json) => ChildListUpdateResponse(
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
    required this.bookingId,
    required this.rideId,
    required this.code,
    required this.startDate,
    required this.endDate,
    required this.isFinished,
  });

  int id;
  int bookingId;
  int rideId;
  String code;
  DateTime startDate;
  DateTime endDate;
  int isFinished;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    bookingId: json["booking_id"],
    rideId: json["ride_id"],
    code: json["code"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    isFinished: json["is_finished"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "ride_id": rideId,
    "code": code,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "is_finished": isFinished,
  };
}
