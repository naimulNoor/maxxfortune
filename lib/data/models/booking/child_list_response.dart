// To parse this JSON data, do
//
//     final childrenListResponse = childrenListResponseFromJson(jsonString);

import 'dart:convert';

ChildrenListResponse childrenListResponseFromJson(String str) => ChildrenListResponse.fromJson(json.decode(str));

String childrenListResponseToJson(ChildrenListResponse data) => json.encode(data.toJson());

class ChildrenListResponse {
  ChildrenListResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool success;
  String msg;
  List<Datum>? data;

  factory ChildrenListResponse.fromJson(Map<String, dynamic> json) => ChildrenListResponse(
    success: json["success"],
    msg: json["msg"],
    data: json["data"]==null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": data==null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  String name;
  DateTime createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"]==null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

