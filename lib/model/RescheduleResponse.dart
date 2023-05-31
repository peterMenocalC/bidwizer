// To parse this JSON data, do
//
//     final rescheduleResponse = rescheduleResponseFromJson(jsonString);

import 'dart:convert';

RescheduleResponse rescheduleResponseFromJson(String str) => RescheduleResponse.fromJson(json.decode(str));

String rescheduleResponseToJson(RescheduleResponse data) => json.encode(data.toJson());

class RescheduleResponse {
  RescheduleResponse({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory RescheduleResponse.fromJson(Map<String, dynamic> json) => RescheduleResponse(
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
    this.vehicle,
    this.id,
    this.vehicleId,
    this.startTime,
    this.auctionCloseTime,
    this.baseValuation,
    this.nextBidAmount,
    this.bidGap,
    this.status,
    this.deleted,
    this.disabled,
    this.createdBy,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.currentBidAmount,
  });

  Vehicle vehicle;
  String id;
  String vehicleId;
  DateTime startTime;
  DateTime auctionCloseTime;
  int baseValuation;
  int nextBidAmount;
  int bidGap;
  String status;
  bool deleted;
  bool disabled;
  String createdBy;
  String currency;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int currentBidAmount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    vehicle: Vehicle.fromJson(json["vehicle"]),
    id: json["_id"],
    vehicleId: json["vehicleId"],
    startTime: DateTime.parse(json["startTime"]),
    auctionCloseTime: DateTime.parse(json["AuctionCloseTime"]),
    baseValuation: json["baseValuation"],
    nextBidAmount: json["NextBidAmount"],
    bidGap: json["bidGap"],
    status: json["status"],
    deleted: json["deleted"],
    disabled: json["disabled"],
    createdBy: json["createdBy"],
    currency: json["currency"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    currentBidAmount: json["currentBidAmount"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle": vehicle.toJson(),
    "_id": id,
    "vehicleId": vehicleId,
    "startTime": startTime.toIso8601String(),
    "AuctionCloseTime": auctionCloseTime.toIso8601String(),
    "baseValuation": baseValuation,
    "NextBidAmount": nextBidAmount,
    "bidGap": bidGap,
    "status": status,
    "deleted": deleted,
    "disabled": disabled,
    "createdBy": createdBy,
    "currency": currency,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "currentBidAmount": currentBidAmount,
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
    this.photoUrl,
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
  String photoUrl;

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
    photoUrl: json["photoUrl"],
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
    "photoUrl": photoUrl,
  };
}
