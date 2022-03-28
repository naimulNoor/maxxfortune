import 'dart:convert';

PricingResponse pricingResponseFromJson(String str) => PricingResponse.fromJson(json.decode(str));

String pricingResponseToJson(PricingResponse data) => json.encode(data.toJson());

class PricingResponse {
  PricingResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory PricingResponse.fromJson(Map<String, dynamic> json) => PricingResponse(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.value,
    required this.isOffer,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String startTime;
  String endTime;
  int value;
  int isOffer;
  String remarks;
  DateTime createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    value: json["value"],
    isOffer: json["is_offer"],
    remarks: json["remarks"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime,
    "end_time": endTime,
    "value": value,
    "is_offer": isOffer,
    "remarks": remarks,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt?.toIso8601String(),
  };
}