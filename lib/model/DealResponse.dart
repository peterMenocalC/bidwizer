// To parse this JSON data, do
//
//     final dealResponse = dealResponseFromJson(jsonString);

import 'dart:convert';

DealResponse dealResponseFromJson(String str) => DealResponse.fromJson(json.decode(str));

String dealResponseToJson(DealResponse data) => json.encode(data.toJson());

class DealResponse {
  DealResponse({
    this.status,
    this.data,
  });

  int status;
  List<Datum> data;

  factory DealResponse.fromJson(Map<String, dynamic> json) => DealResponse(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.paymentDetails,
    this.id,
    this.auctionId,
    this.vehicleId,
    this.sellerId,
    this.buyerId,
    this.title,
    this.shippingStatus,
    this.status,
    this.datumId,
    this.vehicle,
  });

  PaymentDetails paymentDetails;
  String id;
  String auctionId;
  String vehicleId;
  String sellerId;
  String buyerId;
  String title;
  String shippingStatus;
  String status;
  String datumId;
  Vehicle vehicle;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    paymentDetails: PaymentDetails.fromJson(json["paymentDetails"]),
    id: json["_id"],
    auctionId: json["auctionId"],
    vehicleId: json["vehicleId"],
    sellerId: json["sellerId"],
    buyerId: json["buyerId"],
    title: json["title"],
    shippingStatus: json["shippingStatus"],
    status: json["status"],
    datumId: json["id"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "paymentDetails": paymentDetails.toJson(),
    "_id": id,
    "auctionId": auctionId,
    "vehicleId": vehicleId,
    "sellerId": sellerId,
    "buyerId": buyerId,
    "title": title,
    "shippingStatus": shippingStatus,
    "status": status,
    "id": datumId,
    "vehicle": vehicle.toJson(),
  };
}

class PaymentDetails {
  PaymentDetails({
    this.buyerFee,
    this.sellerFee,
    this.finalBidAmount,
  });

  BuyerFee buyerFee;
  SellerFee sellerFee;
  int finalBidAmount;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    buyerFee: BuyerFee.fromJson(json["buyerFee"]),
    sellerFee: SellerFee.fromJson(json["sellerFee"]),
    finalBidAmount: json["finalBidAmount"],
  );

  Map<String, dynamic> toJson() => {
    "buyerFee": buyerFee.toJson(),
    "sellerFee": sellerFee.toJson(),
    "finalBidAmount": finalBidAmount,
  };
}

class BuyerFee {
  BuyerFee({
    this.transportation,
    this.paidFee,
    this.buyerConvenienceFee,
  });

  Transportation transportation;
  bool paidFee;
  int buyerConvenienceFee;

  factory BuyerFee.fromJson(Map<String, dynamic> json) => BuyerFee(
    transportation: Transportation.fromJson(json["transportation"]),
    paidFee: json["paidFee"],
    buyerConvenienceFee: json["buyerConvenienceFee"],
  );

  Map<String, dynamic> toJson() => {
    "transportation": transportation.toJson(),
    "paidFee": paidFee,
    "buyerConvenienceFee": buyerConvenienceFee,
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
    this.paidFee,
    this.sellerConvenienceFee,
  });

  bool paidFee;
  int sellerConvenienceFee;

  factory SellerFee.fromJson(Map<String, dynamic> json) => SellerFee(
    paidFee: json["paidFee"],
    sellerConvenienceFee: json["sellerConvenienceFee"],
  );

  Map<String, dynamic> toJson() => {
    "paidFee": paidFee,
    "sellerConvenienceFee": sellerConvenienceFee,
  };
}

class Vehicle {
  Vehicle({
    this.vin,
    this.year,
    this.make,
    this.model,
    this.bodyType,
    this.trim,
    this.transmission,
    this.drivetrain,
    this.engineType,
    this.fuelType,
    this.extCol,
    this.intCol,
    this.odomReading,
    this.odomUnit,
    this.photos,
  });

  String vin;
  int year;
  String make;
  String model;
  String bodyType;
  String trim;
  String transmission;
  String drivetrain;
  String engineType;
  String fuelType;
  String extCol;
  String intCol;
  int odomReading;
  String odomUnit;
  List<Photo> photos;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    vin: json["vin"],
    year: json["year"],
    make: json["make"],
    model: json["model"],
    bodyType: json["body_type"],
    trim: json["trim"],
    transmission: json["transmission"],
    drivetrain: json["drivetrain"],
    engineType: json["engine_type"],
    fuelType: json["fuel_type"],
    extCol: json["ext_col"],
    intCol: json["int_col"],
    odomReading: json["odom_reading"],
    odomUnit: json["odom_unit"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "vin": vin,
    "year": year,
    "make": make,
    "model": model,
    "body_type": bodyType,
    "trim": trim,
    "transmission": transmission,
    "drivetrain": drivetrain,
    "engine_type": engineType,
    "fuel_type": fuelType,
    "ext_col": extCol,
    "int_col": intCol,
    "odom_reading": odomReading,
    "odom_unit": odomUnit,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
  };
}

class Photo {
  Photo({
    this.photoCode,
    this.photoLabel,
    this.url,
    this.approved,
    this.approvedMessage,
    this.createdAt,
    this.updatedAt,
  });

  int photoCode;
  String photoLabel;
  String url;
  bool approved;
  String approvedMessage;
  DateTime createdAt;
  DateTime updatedAt;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photoCode: json["photo_code"],
    photoLabel: json["photo_label"],
    url: json["url"],
    approved: json["approved"],
    approvedMessage: json["approved_message"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "photo_code": photoCode,
    "photo_label": photoLabel,
    "url": url,
    "approved": approved,
    "approved_message": approvedMessage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
