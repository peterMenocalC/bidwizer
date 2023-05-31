

import 'dart:convert';

MutationResponse mutationResponseFromJson(String str) => MutationResponse.fromJson(json.decode(str));

String mutationResponseToJson(MutationResponse data) => json.encode(data.toJson());

class MutationResponse {
  MutationResponse({
    this.submitBid,
  });

  SubmitBid submitBid;

  factory MutationResponse.fromJson(Map<String, dynamic> json) => MutationResponse(
    submitBid: SubmitBid.fromJson(json["submitBid"]),
  );

  Map<String, dynamic> toJson() => {
    "submitBid": submitBid.toJson(),
  };
}

class SubmitBid {
  SubmitBid({
    this.auctionId,
    this.bidPrice,
    this.bidderId,
    this.bidder,
    this.isAccepted,
    this.rejectionReason,
    this.nextBidAmount,
  });

  String auctionId;
  int bidPrice;
  String bidderId;
  Bidder bidder;
  bool isAccepted;
  String rejectionReason;
  int nextBidAmount;

  factory SubmitBid.fromJson(Map<String, dynamic> json) => SubmitBid(
    auctionId: json["auctionId"],
    bidPrice: json["bidPrice"],
    bidderId: json["bidderId"],
    bidder: Bidder.fromJson(json["bidder"]),
    isAccepted: json["isAccepted"],
    rejectionReason: json["rejectionReason"],
    nextBidAmount: json["NextBidAmount"],
  );

  Map<String, dynamic> toJson() => {
    "auctionId": auctionId,
    "bidPrice": bidPrice,
    "bidderId": bidderId,
    "bidder": bidder.toJson(),
    "isAccepted": isAccepted,
    "rejectionReason": rejectionReason,
    "NextBidAmount": nextBidAmount,
  };
}

class Bidder {
  Bidder({
    this.firstName,
    this.lastName,
    this.id,
  });

  String firstName;
  String lastName;
  String id;

  factory Bidder.fromJson(Map<String, dynamic> json) => Bidder(
    firstName: json["firstName"],
    lastName: json["lastName"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "_id": id,
  };
}
