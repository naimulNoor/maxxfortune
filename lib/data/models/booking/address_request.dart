import 'dart:convert';

AddressRequest addressRequestFromJson(String str) => AddressRequest.fromJson(json.decode(str));

String addressRequestToJson(AddressRequest data) => json.encode(data.toJson());

class AddressRequest {
  AddressRequest({
    required this.pickupPostalCode,
    required this.pickupLocation,
    required this.pickupRemarks,
    required this.dropOffPostalCode,
    required this.dropOffLocation,
    required this.dropOffRemarks,
    this.comments,
    required this.distance,
    required this.price,
    required this.pricePerKm,
  });

  String pickupPostalCode;
  String pickupLocation;
  String pickupRemarks;
  String dropOffPostalCode;
  String dropOffLocation;
  String dropOffRemarks;
  String? comments;
  double distance;
  double price;
  double pricePerKm;

  factory AddressRequest.fromJson(Map<String, dynamic> json) => AddressRequest(
    pickupPostalCode: json["pickup_postal_code"],
    pickupLocation: json["pickup_location"],
    pickupRemarks: json["pickup_remarks"],
    dropOffPostalCode: json["drop_off_postal_code"],
    dropOffLocation: json["drop_off_location"],
    dropOffRemarks: json["drop_off_remarks"],
    comments: json["comments"],
    distance: json["distance"],
    price: json["price"],
    pricePerKm : json["price_per_km"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_postal_code": pickupPostalCode,
    "pickup_location": pickupLocation,
    "pickup_remarks": pickupRemarks,
    "drop_off_postal_code": dropOffPostalCode,
    "drop_off_location": dropOffLocation,
    "drop_off_remarks": dropOffRemarks,
    "comments": comments,
    "distance" : distance,
    "price" : price,
    "price_per_km" : pricePerKm,
  };
}
