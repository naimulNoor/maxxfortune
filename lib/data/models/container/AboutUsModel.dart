

import 'dart:convert';

AboutUsModel allOrdersFromJson(String str) => AboutUsModel.fromJson(json.decode(str));

String allOrdersToJson(AboutUsModel data) => json.encode(data.toJson());

class AboutUsModel {
  AboutUsModel({
     required this.data,
  });

  List<Data> data;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.id,
    required this.wwvTitle,
    required this.wwvText,
    required this.missionText,
    required this.visionText,
    required this.appStoreLink,
    required this.playStoreLink,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String wwvTitle;
  String wwvText;
  String missionText;
  String visionText;
  String appStoreLink;
  String playStoreLink;
  dynamic createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    wwvTitle: json["wwv_title"],
    wwvText: json["wwv_text"],
    missionText: json["mission_text"],
    visionText: json["vision_text"],
    appStoreLink: json["app_store_link"],
    playStoreLink: json["play_store_link"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wwv_title": wwvTitle,
    "wwv_text": wwvText,
    "mission_text": missionText,
    "vision_text": visionText,
    "app_store_link": appStoreLink,
    "play_store_link": playStoreLink,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
  };
}
