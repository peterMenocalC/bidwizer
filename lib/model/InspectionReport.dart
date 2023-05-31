// To parse this JSON data, do
//
//     final inspectionReport = inspectionReportFromJson(jsonString);

import 'dart:convert';

InspectionReport inspectionReportFromJson(String str) => InspectionReport.fromJson(json.decode(str));

String inspectionReportToJson(InspectionReport data) => json.encode(data.toJson());

class InspectionReport {
  InspectionReport({
    this.status,
    this.data,
  });

  int status;
  Data data;

  factory InspectionReport.fromJson(Map<String, dynamic> json) => InspectionReport(
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
    this.id,
    this.vin,
    this.paveSessionKey,
    this.vehicleOwnerId,
    this.photos,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.announcements,
    this.baseValuation,
    this.conditionReport,
    this.disclosures,
    this.inspection,
    this.landingPage,
    this.location,
    this.session,
    this.vehicle,
  });

  String id;
  String vin;
  String paveSessionKey;
  String vehicleOwnerId;
  List<PhotoElement> photos;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic announcements;
  int baseValuation;
  String conditionReport;
  dynamic disclosures;
  Inspection inspection;
  String landingPage;
  Location location;
  Session session;
  DataVehicle vehicle;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    vin: json["vin"],
    paveSessionKey: json["pave_session_key"],
    vehicleOwnerId: json["vehicleOwnerID"],
    photos: List<PhotoElement>.from(json["photos"].map((x) => PhotoElement.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    announcements: json["announcements"],
    baseValuation: json["baseValuation"],
    conditionReport: json["condition_report"],
    disclosures: json["disclosures"],
    inspection: Inspection.fromJson(json["inspection"]),
    landingPage: json["landing_page"],
    location: Location.fromJson(json["location"]),
    session: Session.fromJson(json["session"]),
    vehicle: DataVehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "vin": vin,
    "pave_session_key": paveSessionKey,
    "vehicleOwnerID": vehicleOwnerId,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "announcements": announcements,
    "baseValuation": baseValuation,
    "condition_report": conditionReport,
    "disclosures": disclosures,
    "inspection": inspection.toJson(),
    "landing_page": landingPage,
    "location": location.toJson(),
    "session": session.toJson(),
    "vehicle": vehicle.toJson(),
  };
}

class Inspection {
  Inspection({
    this.damagesOverview,
    this.detectedDamages,
    this.detectedStatus,
    this.grading,
    this.annotatedImages,
    this.caseDetails,
  });

  DamagesOverview damagesOverview;
  List<DetectedDamage> detectedDamages;
  DetectedStatus detectedStatus;
  Grading grading;
  List<dynamic> annotatedImages;
  CaseDetails caseDetails;

  factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
    damagesOverview: DamagesOverview.fromJson(json["damages_overview"]),
    detectedDamages: List<DetectedDamage>.from(json["detected_damages"].map((x) => DetectedDamage.fromJson(x))),
    detectedStatus: DetectedStatus.fromJson(json["detected_status"]),
    grading: Grading.fromJson(json["grading"]),
    annotatedImages: List<dynamic>.from(json["annotated_images"].map((x) => x)),
    caseDetails: CaseDetails.fromJson(json["case_details"]),
  );

  Map<String, dynamic> toJson() => {
    "damages_overview": damagesOverview.toJson(),
    "detected_damages": List<dynamic>.from(detectedDamages.map((x) => x.toJson())),
    "detected_status": detectedStatus.toJson(),
    "grading": grading.toJson(),
    "annotated_images": List<dynamic>.from(annotatedImages.map((x) => x)),
    "case_details": caseDetails.toJson(),
  };
}

class CaseDetails {
  CaseDetails({
    this.caseStartTime,
    this.caseEndTime,
  });

  DateTime caseStartTime;
  DateTime caseEndTime;

  factory CaseDetails.fromJson(Map<String, dynamic> json) => CaseDetails(
    caseStartTime: DateTime.parse(json["case_start_time"]),
    caseEndTime: DateTime.parse(json["case_end_time"]),
  );

  Map<String, dynamic> toJson() => {
    "case_start_time": caseStartTime.toIso8601String(),
    "case_end_time": caseEndTime.toIso8601String(),
  };
}

class DamagesOverview {
  DamagesOverview({
    this.totalDamages,
    this.maxGradePerItem,
    this.maxTotalGrade,
  });

  int totalDamages;
  int maxGradePerItem;
  int maxTotalGrade;

  factory DamagesOverview.fromJson(Map<String, dynamic> json) => DamagesOverview(
    totalDamages: json["totalDamages"],
    maxGradePerItem: json["maxGradePerItem"],
    maxTotalGrade: json["maxTotalGrade"],
  );

  Map<String, dynamic> toJson() => {
    "totalDamages": totalDamages,
    "maxGradePerItem": maxGradePerItem,
    "maxTotalGrade": maxTotalGrade,
  };
}

class DetectedDamage {
  DetectedDamage({
    this.damageGroup,
    this.component,
    this.damageName,
    this.componentLabel,
    this.userResponse,
    this.source,
    this.label,
    this.description,
    this.tolerance,
    this.repairMethod,
    this.repairType,
    this.unitMeasure,
    this.estimateCategory,
    this.laborHrs,
    this.laborTotal,
    this.partsMaterials,
    this.total,
    this.gradeScore,
    this.frameGradeScore,
    this.photo,
    this.uuid,
    this.croppedUrl,
    this.croppedCode,
    this.estimateIncluded,
    this.estimateTbd,
  });

  String damageGroup;
  String component;
  String damageName;
  String componentLabel;
  dynamic userResponse;
  String source;
  String label;
  String description;
  String tolerance;
  String repairMethod;
  String repairType;
  String unitMeasure;
  String estimateCategory;
  int laborHrs;
  int laborTotal;
  int partsMaterials;
  int total;
  int gradeScore;
  int frameGradeScore;
  DetectedDamagePhoto photo;
  String uuid;
  String croppedUrl;
  String croppedCode;
  bool estimateIncluded;
  bool estimateTbd;

  factory DetectedDamage.fromJson(Map<String, dynamic> json) => DetectedDamage(
    damageGroup: json["damage_group"],
    component: json["component"],
    damageName: json["damage_name"],
    componentLabel: json["component_label"],
    userResponse: json["user_response"],
    source: json["source"],
    label: json["label"],
    description: json["description"],
    tolerance: json["tolerance"],
    repairMethod: json["repair_method"],
    repairType: json["repair_type"],
    unitMeasure: json["unit_measure"],
    estimateCategory: json["estimate_category"],
    laborHrs: json["labor_hrs"],
    laborTotal: json["labor_total"],
    partsMaterials: json["parts_materials"],
    total: json["total"],
    gradeScore: json["grade_score"],
    frameGradeScore: json["frame_grade_score"],
    photo: DetectedDamagePhoto.fromJson(json["photo"]),
    uuid: json["uuid"],
    croppedUrl: json["cropped_url"],
    croppedCode: json["cropped_code"],
    estimateIncluded: json["estimate_included"],
    estimateTbd: json["estimate_tbd"],
  );

  Map<String, dynamic> toJson() => {
    "damage_group": damageGroup,
    "component": component,
    "damage_name": damageName,
    "component_label": componentLabel,
    "user_response": userResponse,
    "source": source,
    "label": label,
    "description": description,
    "tolerance": tolerance,
    "repair_method": repairMethod,
    "repair_type": repairType,
    "unit_measure": unitMeasure,
    "estimate_category": estimateCategory,
    "labor_hrs": laborHrs,
    "labor_total": laborTotal,
    "parts_materials": partsMaterials,
    "total": total,
    "grade_score": gradeScore,
    "frame_grade_score": frameGradeScore,
    "photo": photo.toJson(),
    "uuid": uuid,
    "cropped_url": croppedUrl,
    "cropped_code": croppedCode,
    "estimate_included": estimateIncluded,
    "estimate_tbd": estimateTbd,
  };
}

class DetectedDamagePhoto {
  DetectedDamagePhoto({
    this.code,
    this.url,
  });

  String code;
  String url;

  factory DetectedDamagePhoto.fromJson(Map<String, dynamic> json) => DetectedDamagePhoto(
    code: json["code"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "url": url,
  };
}

class DetectedStatus {
  DetectedStatus({
    this.interiorStatus,
    this.tireStatus,
  });

  String interiorStatus;
  String tireStatus;

  factory DetectedStatus.fromJson(Map<String, dynamic> json) => DetectedStatus(
    interiorStatus: json["interior_status"],
    tireStatus: json["tire_status"],
  );

  Map<String, dynamic> toJson() => {
    "interior_status": interiorStatus,
    "tire_status": tireStatus,
  };
}

class Grading {
  Grading({
    this.standardA,
    this.standardB,
    this.standardC,
  });

  int standardA;
  String standardB;
  String standardC;

  factory Grading.fromJson(Map<String, dynamic> json) => Grading(
    standardA: json["standard_A"],
    standardB: json["standard_B"],
    standardC: json["standard_C"],
  );

  Map<String, dynamic> toJson() => {
    "standard_A": standardA,
    "standard_B": standardB,
    "standard_C": standardC,
  };
}

class Location {
  Location({
    this.address,
    this.latitude,
    this.longitude,
    this.streetNum,
    this.street,
    this.city,
    this.state,
    this.stateCode,
    this.countryCode,
    this.postCode,
    this.country,
    this.ip,
  });

  String address;
  String latitude;
  String longitude;
  String streetNum;
  String street;
  String city;
  String state;
  String stateCode;
  String countryCode;
  String postCode;
  String country;
  String ip;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    streetNum: json["street_num"],
    street: json["street"],
    city: json["city"],
    state: json["state"],
    stateCode: json["state_code"],
    countryCode: json["country_code"],
    postCode: json["post_code"],
    country: json["country"],
    ip: json["ip"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "street_num": streetNum,
    "street": street,
    "city": city,
    "state": state,
    "state_code": stateCode,
    "country_code": countryCode,
    "post_code": postCode,
    "country": country,
    "ip": ip,
  };
}

class PhotoElement {
  PhotoElement({
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
  ApprovedMessage approvedMessage;
  DateTime createdAt;
  DateTime updatedAt;

  factory PhotoElement.fromJson(Map<String, dynamic> json) => PhotoElement(
    photoCode: json["photo_code"],
    photoLabel: json["photo_label"],
    url: json["url"],
    approved: json["approved"],
    approvedMessage: approvedMessageValues.map[json["approved_message"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "photo_code": photoCode,
    "photo_label": photoLabel,
    "url": url,
    "approved": approved,
    "approved_message": approvedMessageValues.reverse[approvedMessage],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum ApprovedMessage { ACCEPTED }

final approvedMessageValues = EnumValues({
  "Accepted": ApprovedMessage.ACCEPTED
});

class Session {
  Session({
    this.sessionKey,
    this.theme,
    this.active,
    this.status,
    this.redirectUrl,
    this.inspectStartedAt,
    this.inspectEndedAt,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.options,
    this.userAccount,
    this.source,
    this.vehicle,
  });

  String sessionKey;
  String theme;
  bool active;
  String status;
  String redirectUrl;
  DateTime inspectStartedAt;
  DateTime inspectEndedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String language;
  Options options;
  UserAccount userAccount;
  Source source;
  SessionVehicle vehicle;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    sessionKey: json["session_key"],
    theme: json["theme"],
    active: json["active"],
    status: json["status"],
    redirectUrl: json["redirect_url"],
    inspectStartedAt: DateTime.parse(json["inspect_started_at"]),
    inspectEndedAt: DateTime.parse(json["inspect_ended_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    language: json["language"],
    options: Options.fromJson(json["options"]),
    userAccount: UserAccount.fromJson(json["user_account"]),
    source: Source.fromJson(json["source"]),
    vehicle: SessionVehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "session_key": sessionKey,
    "theme": theme,
    "active": active,
    "status": status,
    "redirect_url": redirectUrl,
    "inspect_started_at": inspectStartedAt.toIso8601String(),
    "inspect_ended_at": inspectEndedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "language": language,
    "options": options.toJson(),
    "user_account": userAccount.toJson(),
    "source": source.toJson(),
    "vehicle": vehicle.toJson(),
  };
}

class Options {
  Options({
    this.sms,
  });

  Sms sms;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    sms: Sms.fromJson(json["sms"]),
  );

  Map<String, dynamic> toJson() => {
    "sms": sms.toJson(),
  };
}

class Sms {
  Sms({
    this.to,
    this.toName,
    this.from,
    this.by,
  });

  String to;
  dynamic toName;
  String from;
  dynamic by;

  factory Sms.fromJson(Map<String, dynamic> json) => Sms(
    to: json["to"],
    toName: json["to_name"],
    from: json["from"],
    by: json["by"],
  );

  Map<String, dynamic> toJson() => {
    "to": to,
    "to_name": toName,
    "from": from,
    "by": by,
  };
}

class Source {
  Source({
    this.type,
    this.properties,
  });

  String type;
  Properties properties;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    type: json["type"],
    properties: Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties.toJson(),
  };
}

class Properties {
  Properties({
    this.apiName,
    this.dashboardUsername,
  });

  String apiName;
  String dashboardUsername;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    apiName: json["api_name"],
    dashboardUsername: json["dashboard_username"],
  );

  Map<String, dynamic> toJson() => {
    "api_name": apiName,
    "dashboard_username": dashboardUsername,
  };
}

class UserAccount {
  UserAccount({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  String username;
  String firstName;
  String lastName;
  String email;
  String phone;

  factory UserAccount.fromJson(Map<String, dynamic> json) => UserAccount(
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
  };
}

class SessionVehicle {
  SessionVehicle({
    this.id,
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
  });

  int id;
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
  String odomReading;
  String odomUnit;

  factory SessionVehicle.fromJson(Map<String, dynamic> json) => SessionVehicle(
    id: json["id"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
  };
}

class DataVehicle {
  DataVehicle({
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

  factory DataVehicle.fromJson(Map<String, dynamic> json) => DataVehicle(
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
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
