import 'dart:convert';

InfoRequest infoRequestFromJson(String str) => InfoRequest.fromJson(json.decode(str));

String infoRequestToJson(InfoRequest data) => json.encode(data.toJson());

class InfoRequest {
  InfoRequest({
    required this.childNames,
    required this.childId,
    required this.startDate,
    required this.endDate,
    required this.pickupTime,
    required this.dropOffTime,
  });

  List<String> childNames;
  List<int> childId;
  DateTime startDate;
  DateTime endDate;
  String pickupTime;
  String dropOffTime;

  factory InfoRequest.fromJson(Map<String, dynamic> json) => InfoRequest(
    childNames: List<String>.from(json["child_names"].map((x) => x)),
    childId: List<int>.from(json["child_id"].map((x) => x)),
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    pickupTime: json["pickup_time"],
    dropOffTime: json["drop_off_time"]
  );

  Map<String, dynamic> toJson() => {
    "child_names": List<dynamic>.from(childNames.map((x) => x)),
    "child_id": List<dynamic>.from(childId.map((x) => x)),
    "start_date": startDate.toIso8601String(),
    "end_date": endDate.toIso8601String(),
    "pickup_time": pickupTime,
    "drop_off_time": dropOffTime,
  };
}