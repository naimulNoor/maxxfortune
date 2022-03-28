import 'dart:convert';

RatingRequest ratingRequestFromJson(String str) => RatingRequest.fromJson(json.decode(str));

String ratingRequestToJson(RatingRequest data) => json.encode(data.toJson());

class RatingRequest {
  RatingRequest({
    required this.id,
    required this.rating,
    required this.verbatim,
  });

  int id;
  double rating;
  String verbatim;

  factory RatingRequest.fromJson(Map<String, dynamic> json) => RatingRequest(
    id: json["id"],
    rating: json["rating"].toDouble(),
    verbatim: json["verbatim"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "verbatim": verbatim,
  };
}