// To parse this JSON data, do
//
//     final afterAuctionSubscriptionResponse = afterAuctionSubscriptionResponseFromJson(jsonString);

import 'dart:convert';

AfterAuctionSubscriptionResponse afterAuctionSubscriptionResponseFromJson(String str) => AfterAuctionSubscriptionResponse.fromJson(json.decode(str));

String afterAuctionSubscriptionResponseToJson(AfterAuctionSubscriptionResponse data) => json.encode(data.toJson());

class AfterAuctionSubscriptionResponse {
  AfterAuctionSubscriptionResponse({
    this.onUpdateDealData,
  });

  OnUpdateDealData onUpdateDealData;

  factory AfterAuctionSubscriptionResponse.fromJson(Map<String, dynamic> json) => AfterAuctionSubscriptionResponse(
    onUpdateDealData: OnUpdateDealData.fromJson(json["onUpdateDealData"]),
  );

  Map<String, dynamic> toJson() => {
    "onUpdateDealData": onUpdateDealData.toJson(),
  };
}

class OnUpdateDealData {
  OnUpdateDealData({
    this.id,
    this.data,
  });

  String id;
  String data;

  factory OnUpdateDealData.fromJson(Map<String, dynamic> json) => OnUpdateDealData(
    id: json["id"],
    data:json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
  };
}