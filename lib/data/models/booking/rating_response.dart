import 'dart:convert';

RatingResponse ratingResponseFromJson(String str) => RatingResponse.fromJson(json.decode(str));

String ratingResponseToJson(RatingResponse data) => json.encode(data.toJson());

class RatingResponse {
  RatingResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory RatingResponse.fromJson(Map<String, dynamic> json) => RatingResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}
