class SubscriptionDealResponse {
  SubscriptionDealResponse({
    this.id,
    this.auctionId,
    this.vehicleId,
    this.sellerId,
    this.buyerId,
    this.currentlyAssignedTo,
    this.title,
    this.shippingStatus,
    this.status,
    this.signedBySeller,
    this.signedByBuyer,
    this.signatureDocId,
    this.sellerSignature,
    this.buyerSignature,
    this.paymentDetails,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String auctionId;
  String vehicleId;
  String sellerId;
  String buyerId;
  String currentlyAssignedTo;
  String title;
  String shippingStatus;
  String status;
  bool signedBySeller;
  bool signedByBuyer;
  String signatureDocId;
  ErSignature sellerSignature;
  ErSignature buyerSignature;
  PaymentDetails paymentDetails;
  String createdAt;
  String updatedAt;
  int v;

  factory SubscriptionDealResponse.fromJson(Map<String, dynamic> json) => SubscriptionDealResponse(
    id: json["_id"],
    auctionId: json["auctionId"],
    vehicleId: json["vehicleId"],
    sellerId: json["sellerId"],
    buyerId: json["buyerId"],
    currentlyAssignedTo: json["currentlyAssignedTo"],
    title: json["title"],
    shippingStatus: json["shippingStatus"],
    status: json["status"],
    signedBySeller: json["signedBySeller"],
    signedByBuyer: json["signedByBuyer"],
    signatureDocId: json["signatureDocID"],
    sellerSignature: ErSignature.fromJson(json["sellerSignature"]),
    buyerSignature: ErSignature.fromJson(json["buyerSignature"]),
    paymentDetails: PaymentDetails.fromJson(json["paymentDetails"]),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "auctionId": auctionId,
    "vehicleId": vehicleId,
    "sellerId": sellerId,
    "buyerId": buyerId,
    "currentlyAssignedTo": currentlyAssignedTo,
    "title": title,
    "shippingStatus": shippingStatus,
    "status": status,
    "signedBySeller": signedBySeller,
    "signedByBuyer": signedByBuyer,
    "signatureDocID": signatureDocId,
    "sellerSignature": sellerSignature.toJson(),
    "buyerSignature": buyerSignature.toJson(),
    "paymentDetails": paymentDetails.toJson(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}

class ErSignature {
  ErSignature({
    this.signatureSessionId,
    this.signedAt,
    this.documentLink
  });

  String signatureSessionId;
  String signedAt;
  String documentLink;

  factory ErSignature.fromJson(Map<String, dynamic> json) => ErSignature(
    signatureSessionId: json["signatureSessionId"],
    signedAt:json["signedAt"],
    documentLink: json["documentLink"],
  );

  Map<String, dynamic> toJson() => {
    "signatureSessionId": signatureSessionId,
    "signedAt": signedAt,
    "documentLink": documentLink,
  };
}

class PaymentDetails {
  PaymentDetails({
    this.finalBidAmount,
    this.buyerFee,
    this.sellerFee,
  });

  int finalBidAmount;
  BuyerFee buyerFee;
  SellerFee sellerFee;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    finalBidAmount: json["finalBidAmount"],
    buyerFee: BuyerFee.fromJson(json["buyerFee"]),
    sellerFee: SellerFee.fromJson(json["sellerFee"]),
  );

  Map<String, dynamic> toJson() => {
    "finalBidAmount": finalBidAmount,
    "buyerFee": buyerFee.toJson(),
    "sellerFee": sellerFee.toJson(),
  };
}

class BuyerFee {
  BuyerFee({
    this.buyerConvenienceFee,
    this.paidFee,
    this.transportation,
  });

  int buyerConvenienceFee;
  bool paidFee;
  Transportation transportation;

  factory BuyerFee.fromJson(Map<String, dynamic> json) => BuyerFee(
    buyerConvenienceFee: json["buyerConvenienceFee"],
    paidFee: json["paidFee"],
    transportation: Transportation.fromJson(json["transportation"]),
  );

  Map<String, dynamic> toJson() => {
    "buyerConvenienceFee": buyerConvenienceFee,
    "paidFee": paidFee,
    "transportation": transportation.toJson(),
  };
}

class Transportation {
  Transportation({
    this.costApplied,
    this.transportationAmount,
  });

  bool costApplied;
  int transportationAmount;

  factory Transportation.fromJson(Map<String, dynamic> json) => Transportation(
    costApplied: json["costApplied"],
    transportationAmount: json["transportationAmount"],
  );

  Map<String, dynamic> toJson() => {
    "costApplied": costApplied,
    "transportationAmount": transportationAmount,
  };
}

class SellerFee {
  SellerFee({
    this.sellerConvenienceFee,
    this.paidFee,
  });

  int sellerConvenienceFee;
  bool paidFee;

  factory SellerFee.fromJson(Map<String, dynamic> json) => SellerFee(
    sellerConvenienceFee: json["sellerConvenienceFee"],
    paidFee: json["paidFee"],
  );

  Map<String, dynamic> toJson() => {
    "sellerConvenienceFee": sellerConvenienceFee,
    "paidFee": paidFee,
  };
}
