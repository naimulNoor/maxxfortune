// To parse this JSON data, do
//
//     final payNowResponse = payNowResponseFromJson(jsonString);

import 'dart:convert';

PayNowResponse payNowResponseFromJson(String str) => PayNowResponse.fromJson(json.decode(str));

String payNowResponseToJson(PayNowResponse data) => json.encode(data.toJson());

class PayNowResponse {
  PayNowResponse({
    this.data,
  });

  Data? data;

  factory PayNowResponse.fromJson(Map<String, dynamic> json) => PayNowResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.referenceId,
    required this.instructions,
  });

  String referenceId;
  Instructions instructions;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    referenceId: json["referenceId"],
    instructions: Instructions.fromJson(json["instructions"]),
  );

  Map<String, dynamic> toJson() => {
    "referenceId": referenceId,
    "instructions": instructions.toJson(),
  };
}

class Instructions {
  Instructions({
    required this.qrCodeDisplayImage,
  });

  String qrCodeDisplayImage;

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
    qrCodeDisplayImage: json["qrCodeDisplayImage"],
  );

  Map<String, dynamic> toJson() => {
    "qrCodeDisplayImage": qrCodeDisplayImage,
  };
}
