// To parse this JSON data, do
//
//     final paveVehicleSessionData = paveVehicleSessionDataFromJson(jsonString);

import 'dart:convert';

PaveVehicleSessionData paveVehicleSessionDataFromJson(String str) => PaveVehicleSessionData.fromJson(json.decode(str));

String paveVehicleSessionDataToJson(PaveVehicleSessionData data) => json.encode(data.toJson());

class PaveVehicleSessionData {
  PaveVehicleSessionData({
    this.vehiclesReportData,
    this.vehicleData,
  });

  VehiclesReportData vehiclesReportData;
  VehicleData vehicleData;

  factory PaveVehicleSessionData.fromJson(Map<String, dynamic> json) => PaveVehicleSessionData(
    vehiclesReportData: VehiclesReportData.fromJson(json["vehiclesReportData"]),
    vehicleData: VehicleData.fromJson(json["vehicleData"]),
  );

  Map<String, dynamic> toJson() => {
    "vehiclesReportData": vehiclesReportData.toJson(),
    "vehicleData": vehicleData.toJson(),
  };
}

class VehicleData {
  VehicleData({
    this.photos,
    this.id,
    this.vin,
    this.paveSessionKey,
    this.vehicleOwnerId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.event,
    this.sessionKey,
    this.status,
    this.timestamp,
  });

  List<dynamic> photos;
  String id;
  String vin;
  String paveSessionKey;
  String vehicleOwnerId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String event;
  String sessionKey;
  String status;
  DateTime timestamp;

  factory VehicleData.fromJson(Map<String, dynamic> json) => VehicleData(
    photos: List<dynamic>.from(json["photos"].map((x) => x)),
    id: json["_id"],
    vin: json["vin"],
    paveSessionKey: json["pave_session_key"],
    vehicleOwnerId: json["vehicleOwnerID"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    event: json["event"],
    sessionKey: json["session_key"],
    status: json["status"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "_id": id,
    "vin": vin,
    "pave_session_key": paveSessionKey,
    "vehicleOwnerID": vehicleOwnerId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "event": event,
    "session_key": sessionKey,
    "status": status,
    "timestamp": timestamp.toIso8601String(),
  };
}

class VehiclesReportData {
  VehiclesReportData({
    this.event,
    this.status,
    this.timestamp,
    this.sessionKey,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String event;
  String status;
  DateTime timestamp;
  String sessionKey;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory VehiclesReportData.fromJson(Map<String, dynamic> json) => VehiclesReportData(
    event: json["event"],
    status: json["status"],
    timestamp: DateTime.parse(json["timestamp"]),
    sessionKey: json["session_key"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "event": event,
    "status": status,
    "timestamp": timestamp.toIso8601String(),
    "session_key": sessionKey,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
