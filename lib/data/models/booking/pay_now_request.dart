import 'dart:convert';

PayNowRequest payNowRequestFromJson(String str) => PayNowRequest.fromJson(json.decode(str));

String payNowRequestToJson(PayNowRequest data) => json.encode(data.toJson());

class PayNowRequest {
  PayNowRequest({
    required this.data,
  });

  PayNowRequestData data;

  factory PayNowRequest.fromJson(Map<String, dynamic> json) => PayNowRequest(
    data: PayNowRequestData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class PayNowRequestData {
  PayNowRequestData({
    required this.relationships,
    required this.attributes,
  });

  Relationships relationships;
  Attributes attributes;

  factory PayNowRequestData.fromJson(Map<String, dynamic> json) => PayNowRequestData(
    relationships: Relationships.fromJson(json["relationships"]),
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "relationships": relationships.toJson(),
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes({
    required  this.merchantPrefix,
    required this.referenceId,
  });

  String merchantPrefix;
  String referenceId;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    merchantPrefix: json["merchantPrefix"],
    referenceId: json["referenceId"],
  );

  Map<String, dynamic> toJson() => {
    "merchantPrefix": merchantPrefix,
    "referenceId": referenceId,
  };
}

class Relationships {
  Relationships({
    required this.customerProfile,
  });

  CustomerProfile customerProfile;

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
    customerProfile: CustomerProfile.fromJson(json["customerProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "customerProfile": customerProfile.toJson(),
  };
}

class CustomerProfile {
  CustomerProfile({
    required this.data,
  });

  CustomerProfileData data;

  factory CustomerProfile.fromJson(Map<String, dynamic> json) => CustomerProfile(
    data: CustomerProfileData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class CustomerProfileData {
  CustomerProfileData({
    required this.id,
  });

  String id;

  factory CustomerProfileData.fromJson(Map<String, dynamic> json) => CustomerProfileData(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
