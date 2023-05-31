// To parse this JSON data, do
//
//     final createAuctionResponse = createAuctionResponseFromJson(jsonString);

import 'dart:convert';

CreateAuctionResponse createAuctionResponseFromJson(String str) => CreateAuctionResponse.fromJson(json.decode(str));

String createAuctionResponseToJson(CreateAuctionResponse data) => json.encode(data.toJson());

class CreateAuctionResponse {
  CreateAuctionResponse({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory CreateAuctionResponse.fromJson(Map<String, dynamic> json) => CreateAuctionResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.vehicleId,
    this.startTime,
    this.auctionCloseTime,
    this.baseValuation,
    this.bidGap,
    this.status,
    this.deleted,
    this.vehicle,
    this.createdBy,
    this.currency,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String vehicleId;
  DateTime startTime;
  DateTime auctionCloseTime;
  int baseValuation;
  int bidGap;
  String status;
  bool deleted;
  Vehicle vehicle;
  String createdBy;
  String currency;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    vehicleId: json["vehicleId"],
    startTime: DateTime.parse(json["startTime"]),
    auctionCloseTime: DateTime.parse(json["AuctionCloseTime"]),
    baseValuation: json["baseValuation"],
    bidGap: json["bidGap"],
    status: json["status"],
    deleted: json["deleted"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
    createdBy: json["createdBy"],
    currency: json["currency"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "vehicleId": vehicleId,
    "startTime": startTime.toIso8601String(),
    "AuctionCloseTime": auctionCloseTime.toIso8601String(),
    "baseValuation": baseValuation,
    "bidGap": bidGap,
    "status": status,
    "deleted": deleted,
    "vehicle": vehicle.toJson(),
    "createdBy": createdBy,
    "currency": currency,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
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
  dynamic engineType;
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
