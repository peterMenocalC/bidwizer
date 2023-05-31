// To parse this JSON data, do
//
//     final holdPaymentResponse = holdPaymentResponseFromJson(jsonString);

import 'dart:convert';

HoldPaymentResponse holdPaymentResponseFromJson(String str) => HoldPaymentResponse.fromJson(json.decode(str));

String holdPaymentResponseToJson(HoldPaymentResponse data) => json.encode(data.toJson());

class HoldPaymentResponse {
  HoldPaymentResponse({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory HoldPaymentResponse.fromJson(Map<String, dynamic> json) => HoldPaymentResponse(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.status,
    this.dealId,
  });

  String status;
  String dealId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    dealId: json["dealId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "dealId": dealId,
  };
}
