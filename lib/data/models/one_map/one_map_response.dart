import 'dart:convert';

OneMapResponse oneMapResponseFromJson(String str) => OneMapResponse.fromJson(json.decode(str));

String oneMapResponseToJson(OneMapResponse data) => json.encode(data.toJson());

class OneMapResponse {
  OneMapResponse({
    required this.found,
    required this.totalNumPages,
    required this.pageNum,
    required this.results,
  });

  int found;
  int totalNumPages;
  int pageNum;
  List<Result> results;

  factory OneMapResponse.fromJson(Map<String, dynamic> json) => OneMapResponse(
    found: json["found"],
    totalNumPages: json["totalNumPages"],
    pageNum: json["pageNum"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "totalNumPages": totalNumPages,
    "pageNum": pageNum,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.searchval,
    required this.blkNo,
    required this.roadName,
    required this.building,
    required this.address,
    required this.postal,
    required this.x,
    required this.y,
    required this.latitude,
    required this.longitude,
  });

  String searchval;
  String blkNo;
  String roadName;
  String building;
  String address;
  String postal;
  String x;
  String y;
  String latitude;
  String longitude;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    searchval: json["SEARCHVAL"],
    blkNo: json["BLK_NO"],
    roadName: json["ROAD_NAME"],
    building: json["BUILDING"],
    address: json["ADDRESS"],
    postal: json["POSTAL"],
    x: json["X"],
    y: json["Y"],
    latitude: json["LATITUDE"],
    longitude: json["LONGITUDE"],
  );

  Map<String, dynamic> toJson() => {
    "SEARCHVAL": searchval,
    "BLK_NO": blkNo,
    "ROAD_NAME": roadName,
    "BUILDING": building,
    "ADDRESS": address,
    "POSTAL": postal,
    "X": x,
    "Y": y,
    "LATITUDE": latitude,
    "LONGITUDE": longitude,
  };
}
