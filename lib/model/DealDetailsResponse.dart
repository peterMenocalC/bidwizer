// To parse this JSON data, do
//
//     final dealDetailsResponse = dealDetailsResponseFromJson(jsonString);

import 'dart:convert';

DealDetailsResponse dealDetailsResponseFromJson(String str) => DealDetailsResponse.fromJson(json.decode(str));

String dealDetailsResponseToJson(DealDetailsResponse data) => json.encode(data.toJson());

class DealDetailsResponse {
  DealDetailsResponse({
    this.status,
    this.data,
  });

  int status;
  DealDetailData data;

  factory DealDetailsResponse.fromJson(Map<String, dynamic> json) => DealDetailsResponse(
    status: json["status"],
    data: DealDetailData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class DealDetailData {
  DealDetailData({
    this.sellerSignature,
    this.buyerSignature,
    this.paymentDetails,
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.seller,
    this.buyer,
    this.auditLogs,
    this.dataId,
    this.vehicle,
  });

  ErSignature sellerSignature;
  ErSignature buyerSignature;
  PaymentDetails paymentDetails;
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
  String createdAt;
  String updatedAt;
  int v;
  Buyer seller;
  Buyer buyer;
  List<dynamic> auditLogs;
  String dataId;
  Vehicle vehicle;

  factory DealDetailData.fromJson(Map<String, dynamic> json) => DealDetailData(
    sellerSignature: ErSignature.fromJson(json["sellerSignature"]),
    buyerSignature: ErSignature.fromJson(json["buyerSignature"]),
    paymentDetails: PaymentDetails.fromJson(json["paymentDetails"]),
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
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    seller: Buyer.fromJson(json["seller"]),
    buyer: Buyer.fromJson(json["buyer"]),
    auditLogs: List<dynamic>.from(json["auditLogs"].map((x) => x)),
    dataId: json["id"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "sellerSignature": sellerSignature.toJson(),
    "buyerSignature": buyerSignature.toJson(),
    "paymentDetails": paymentDetails.toJson(),
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "seller": seller.toJson(),
    "buyer": buyer.toJson(),
    "auditLogs": List<dynamic>.from(auditLogs.map((x) => x)),
    "id": dataId,
    "vehicle": vehicle.toJson(),
  };
}


class AuditLog {
  AuditLog({
    this.id,
    this.dealId,
    this.milestoneId,
    this.actionOwner,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.milestone,
    this.auditLogId,
    this.completedAt,
    this.completedBy,
  });

  String id;
  String dealId;
  String milestoneId;
  String actionOwner;
  int v;
  String createdAt;
  String updatedAt;
  Milestone milestone;
  String auditLogId;
  String completedAt;
  String completedBy;

  factory AuditLog.fromJson(Map<String, dynamic> json) => AuditLog(
    id: json["_id"],
    dealId: json["dealId"],
    milestoneId: json["milestoneId"],
    actionOwner: json["actionOwner"],
    v: json["__v"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    milestone: Milestone.fromJson(json["milestone"]),
    auditLogId: json["id"],
    completedAt: json["completedAt"],
    completedBy: json["completedBy"] ,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "dealId": dealId,
    "milestoneId": milestoneId,
    "actionOwner": actionOwner,
    "__v": v,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "milestone": milestone.toJson(),
    "id": auditLogId,
    "completedAt": completedAt,
    "completedBy": completedBy,
  };
}


class Milestone {
  Milestone({
    this.id,
    this.milestone,
    this.deactivated,
    this.visibleTo,
    this.userType,
    this.seq,
  });

  String id;
  String milestone;
  bool deactivated;
  List<VisibleTo> visibleTo;
  String userType;
  int seq;

  factory Milestone.fromJson(Map<String, dynamic> json) => Milestone(
    id: json["_id"],
    milestone: json["milestone"],
    deactivated: json["deactivated"],
    visibleTo: List<VisibleTo>.from(json["visibleTo"].map((x) => visibleToValues.map[x])),
    userType: json["userType"],
    seq: json["seq"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "milestone": milestone,
    "deactivated": deactivated,
    "visibleTo": List<dynamic>.from(visibleTo.map((x) => visibleToValues.reverse[x])),
    "userType": userType,
    "seq": seq,
  };
}

enum VisibleTo { SELLER, BUYER }

final visibleToValues = EnumValues({
  "BUYER": VisibleTo.BUYER,
  "SELLER": VisibleTo.SELLER
});

class Buyer {
  Buyer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.emailVerified,
    this.v,
    this.accountHolderName,
    this.accountNumber,
    this.accountType,
    this.address1,
    this.address2,
    this.authorizedRepresentative,
    this.busneissTitle,
    this.city,
    this.cleanTitle,
    this.deleted,
    this.driversLicenseNumber,
    this.emailCompany,
    this.fllorPlanCompanyName,
    this.floorPlanContactEmail,
    this.floorPlanMainContact,
    this.isDelete,
    this.phoneNumber,
    this.phoneNumberExt,
    this.phoneNumberOffice,
    this.phoneNumberOfficeExt,
    this.routingNumber,
    this.state,
    this.termsAndConditions,
    this.userId,
    this.userNo,
    this.usersLogo,
    this.website,
    this.zip,
    this.mainContactTitle,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String mobile;
  String emailVerified;
  int v;
  String accountHolderName;
  String accountNumber;
  String accountType;
  String address1;
  String address2;
  bool authorizedRepresentative;
  String busneissTitle;
  String city;
  String cleanTitle;
  bool deleted;
  String driversLicenseNumber;
  String emailCompany;
  String fllorPlanCompanyName;
  String floorPlanContactEmail;
  String floorPlanMainContact;
  String isDelete;
  String phoneNumber;
  String phoneNumberExt;
  String phoneNumberOffice;
  String phoneNumberOfficeExt;
  String routingNumber;
  String state;
  String termsAndConditions;
  String userId;
  String userNo;
  String usersLogo;
  String website;
  String zip;
  String mainContactTitle;

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    mobile: json["mobile"],
    emailVerified: json["email_verified"],
    v: json["__v"],
    accountHolderName: json["account_holder_name"],
    accountNumber: json["account_number"],
    accountType: json["account_type"],
    address1: json["address1"],
    address2: json["address2"],
    authorizedRepresentative: json["authorizedRepresentative"],
    busneissTitle: json["busneissTitle"],
    city: json["city"],
    cleanTitle: json["clean_title"],
    deleted: json["deleted"],
    driversLicenseNumber: json["drivers_license_number"],
    emailCompany: json["email_company"],
    fllorPlanCompanyName: json["fllor_plan_company_name"],
    floorPlanContactEmail: json["floor_plan_contact_email"],
    floorPlanMainContact: json["floor_plan_main_contact"],
    isDelete: json["is_delete"],
    phoneNumber: json["phone_number"],
    phoneNumberExt: json["phone_number_ext"],
    phoneNumberOffice: json["phone_number_office"],
    phoneNumberOfficeExt: json["phone_number_office_ext"],
    routingNumber: json["routing_number"],
    state: json["state"],
    termsAndConditions: json["terms_and_conditions"],
    userId: json["userId"],
    userNo: json["userNo"],
    usersLogo: json["users_logo"],
    website: json["website"],
    zip: json["zip"],
    mainContactTitle: json["main_contact_title"] == null ? null : json["main_contact_title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobile": mobile,
    "email_verified": emailVerified,
    "__v": v,
    "account_holder_name": accountHolderName,
    "account_number": accountNumber,
    "account_type": accountType,
    "address1": address1,
    "address2": address2,
    "authorizedRepresentative": authorizedRepresentative,
    "busneissTitle": busneissTitle,
    "city": city,
    "clean_title": cleanTitle,
    "deleted": deleted,
    "drivers_license_number": driversLicenseNumber,
    "email_company": emailCompany,
    "fllor_plan_company_name": fllorPlanCompanyName,
    "floor_plan_contact_email": floorPlanContactEmail,
    "floor_plan_main_contact": floorPlanMainContact,
    "is_delete": isDelete,
    "phone_number": phoneNumber,
    "phone_number_ext": phoneNumberExt,
    "phone_number_office": phoneNumberOffice,
    "phone_number_office_ext": phoneNumberOfficeExt,
    "routing_number": routingNumber,
    "state": state,
    "terms_and_conditions": termsAndConditions,
    "userId": userId,
    "userNo": userNo,
    "users_logo": usersLogo,
    "website": website,
    "zip": zip,
    "main_contact_title": mainContactTitle == null ? null : mainContactTitle,
  };
}

class ErSignature {
  ErSignature({
    this.signatureSessionId,
    this.signedAt,
    this.documentLink
  });

  String signatureSessionId;
  DateTime signedAt;
  String documentLink;

  factory ErSignature.fromJson(Map<String, dynamic> json) => ErSignature(
    signatureSessionId: json["signatureSessionId"],
    signedAt: DateTime.parse(json["signedAt"]),
    documentLink: json["documentLink"],
  );

  Map<String, dynamic> toJson() => {
    "signatureSessionId": signatureSessionId,
    "signedAt": signedAt.toIso8601String(),
    "documentLink" : documentLink
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
  dynamic odomReading;
  String odomUnit;
  String photoUrl;
  String paveSessionKey;

  Vehicle({this.vin,
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
    this.paveSessionKey});

  Vehicle.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    year = json['year'];
    make = json['make'];
    model = json['model'];
    bodyType = json['body_type'];
    trim = json['trim'];
    transmission = json['transmission'];
    drivetrain = json['drivetrain'];
    engineType = json['engine_type'];
    fuelType = json['fuel_type'];
    extCol = json['ext_col'];
    intCol = json['int_col'];
    odomReading = json['odom_reading'];
    odomUnit = json['odom_unit'];
    photoUrl = json['photoUrl'];
    paveSessionKey = json['pave_session_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['year'] = this.year;
    data['make'] = this.make;
    data['model'] = this.model;
    data['body_type'] = this.bodyType;
    data['trim'] = this.trim;
    data['transmission'] = this.transmission;
    data['drivetrain'] = this.drivetrain;
    data['engine_type'] = this.engineType;
    data['fuel_type'] = this.fuelType;
    data['ext_col'] = this.extCol;
    data['int_col'] = this.intCol;
    data['odom_reading'] = this.odomReading;
    data['odom_unit'] = this.odomUnit;
    data['photoUrl'] = this.photoUrl;
    data['pave_session_key'] = this.paveSessionKey;
    return data;
  }
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