// To parse this JSON data, do
//
//     final messageResponse = messageResponseFromJson(jsonString);

import 'dart:convert';

MessageResponse messageResponseFromJson(String str) => MessageResponse.fromJson(json.decode(str));

String messageResponseToJson(MessageResponse data) => json.encode(data.toJson());

class MessageResponse {
  MessageResponse({
    required this.success,
    required this.msg,
  });

  bool success;
  String msg;

  factory MessageResponse.fromJson(Map<String, dynamic> json) => MessageResponse(
    success: json["success"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
  };
}
