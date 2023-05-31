// To parse this JSON data, do
//
//     final purchaseOrderSessionResponse = purchaseOrderSessionResponseFromJson(jsonString);

import 'dart:convert';

PurchaseOrderSessionResponse purchaseOrderSessionResponseFromJson(String str) => PurchaseOrderSessionResponse.fromJson(json.decode(str));

String purchaseOrderSessionResponseToJson(PurchaseOrderSessionResponse data) => json.encode(data.toJson());

class PurchaseOrderSessionResponse {
  PurchaseOrderSessionResponse({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory PurchaseOrderSessionResponse.fromJson(Map<String, dynamic> json) => PurchaseOrderSessionResponse(
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
    this.signatureSessionId,this.documentLink,
  });

  String signatureSessionId;
  String documentLink;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    signatureSessionId: json["signatureSessionId"],
    documentLink: json["documentLink"],
  );

  Map<String, dynamic> toJson() => {
    "signatureSessionId": signatureSessionId,
    "documentLink": documentLink,
  };
}
