class VehicleHistoryResponse {
  int status;
  Data data;

  VehicleHistoryResponse({this.status, this.data});

  VehicleHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<SpecificationData> specificationData;
  List<HistoryData> historyData;

  Data({this.specificationData, this.historyData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['specification_data'] != null) {
      specificationData = [];
      json['specification_data'].forEach((v) {
        specificationData.add(new SpecificationData.fromJson(v));
      });
    }
    if (json['history_data'] != null) {
      historyData = [];
      json['history_data'].forEach((v) {
        historyData.add(new HistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specificationData != null) {
      data['specification_data'] =
          this.specificationData.map((v) => v.toJson()).toList();
    }
    if (this.historyData != null) {
      data['history_data'] = this.historyData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpecificationData {
  String sId;
  String vIN;
  String vehicleId;
  String auctionId;
  List<VehicleSpecifications> vehicleSpecifications;
  int iV;

  SpecificationData(
      {this.sId,
        this.vIN,
        this.vehicleId,
        this.auctionId,
        this.vehicleSpecifications,
        this.iV});

  SpecificationData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vIN = json['VIN'];
    vehicleId = json['vehicleId'];
    auctionId = json['auctionId'];
    if (json['vehicleSpecifications'] != null) {
      vehicleSpecifications = [];
      json['vehicleSpecifications'].forEach((v) {
        vehicleSpecifications.add(new VehicleSpecifications.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['VIN'] = this.vIN;
    data['vehicleId'] = this.vehicleId;
    data['auctionId'] = this.auctionId;
    if (this.vehicleSpecifications != null) {
      data['vehicleSpecifications'] =
          this.vehicleSpecifications.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class VehicleSpecifications {
  Input input;
  Selections selections;
  Attributes attributes;
  bool success;
  String error;

  VehicleSpecifications(
      {this.input, this.selections, this.attributes, this.success, this.error});

  VehicleSpecifications.fromJson(Map<String, dynamic> json) {
    input = json['input'] != null ? new Input.fromJson(json['input']) : null;
    selections = json['selections'] != null
        ? new Selections.fromJson(json['selections'])
        : null;
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.input != null) {
      data['input'] = this.input.toJson();
    }
    if (this.selections != null) {
      data['selections'] = this.selections.toJson();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    data['success'] = this.success;
    data['error'] = this.error;
    return data;
  }
}

class Input {
  String key;
  String vin;
  String format;

  Input({this.key, this.vin, this.format});

  Input.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    vin = json['vin'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['vin'] = this.vin;
    data['format'] = this.format;
    return data;
  }
}

class Selections {
  List<Trims> trims;

  Selections({this.trims});

  Selections.fromJson(Map<String, dynamic> json) {
    if (json['trims'] != null) {
      trims = new List<Trims>();
      json['trims'].forEach((v) {
        trims.add(new Trims.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trims != null) {
      data['trims'] = this.trims.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trims {
  String id;
  String name;
  int selected;
  List<Styles> styles;

  Trims({this.id, this.name, this.selected, this.styles});

  Trims.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selected = json['selected'];
    if (json['styles'] != null) {
      styles = new List<Styles>();
      json['styles'].forEach((v) {
        styles.add(new Styles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selected'] = this.selected;
    if (this.styles != null) {
      data['styles'] = this.styles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Styles {
  String id;
  String name;
  int selected;

  Styles({this.id, this.name, this.selected});

  Styles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['selected'] = this.selected;
    return data;
  }
}

class Attributes {
  String year;
  String make;
  String model;
  String trim;
  String style;
  String type;
  String size;
  String category;
  String madeIn;
  String madeInCity;
  String doors;
  String fuelType;
  String fuelCapacity;
  String cityMileage;
  String highwayMileage;
  String engine;
  String engineSize;
  String engineCylinders;
  String transmission;
  String transmissionType;
  String transmissionSpeeds;
  String drivetrain;
  String antiBrakeSystem;
  String steeringType;
  String curbWeight;
  String grossVehicleWeightRating;
  String overallHeight;
  String overallLength;
  String overallWidth;
  String wheelbaseLength;
  String standardSeating;
  String invoicePrice;
  String deliveryCharges;
  String manufacturerSuggestedRetailPrice;

  Attributes(
      {this.year,
        this.make,
        this.model,
        this.trim,
        this.style,
        this.type,
        this.size,
        this.category,
        this.madeIn,
        this.madeInCity,
        this.doors,
        this.fuelType,
        this.fuelCapacity,
        this.cityMileage,
        this.highwayMileage,
        this.engine,
        this.engineSize,
        this.engineCylinders,
        this.transmission,
        this.transmissionType,
        this.transmissionSpeeds,
        this.drivetrain,
        this.antiBrakeSystem,
        this.steeringType,
        this.curbWeight,
        this.grossVehicleWeightRating,
        this.overallHeight,
        this.overallLength,
        this.overallWidth,
        this.wheelbaseLength,
        this.standardSeating,
        this.invoicePrice,
        this.deliveryCharges,
        this.manufacturerSuggestedRetailPrice});

  Attributes.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    make = json['make'];
    model = json['model'];
    trim = json['trim'];
    style = json['style'];
    type = json['type'];
    size = json['size'];
    category = json['category'];
    madeIn = json['made_in'];
    madeInCity = json['made_in_city'];
    doors = json['doors'];
    fuelType = json['fuel_type'];
    fuelCapacity = json['fuel_capacity'];
    cityMileage = json['city_mileage'];
    highwayMileage = json['highway_mileage'];
    engine = json['engine'];
    engineSize = json['engine_size'];
    engineCylinders = json['engine_cylinders'];
    transmission = json['transmission'];
    transmissionType = json['transmission_type'];
    transmissionSpeeds = json['transmission_speeds'];
    drivetrain = json['drivetrain'];
    antiBrakeSystem = json['anti_brake_system'];
    steeringType = json['steering_type'];
    curbWeight = json['curb_weight'];
    grossVehicleWeightRating = json['gross_vehicle_weight_rating'];
    overallHeight = json['overall_height'];
    overallLength = json['overall_length'];
    overallWidth = json['overall_width'];
    wheelbaseLength = json['wheelbase_length'];
    standardSeating = json['standard_seating'];
    invoicePrice = json['invoice_price'];
    deliveryCharges = json['delivery_charges'];
    manufacturerSuggestedRetailPrice =
    json['manufacturer_suggested_retail_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['make'] = this.make;
    data['model'] = this.model;
    data['trim'] = this.trim;
    data['style'] = this.style;
    data['type'] = this.type;
    data['size'] = this.size;
    data['category'] = this.category;
    data['made_in'] = this.madeIn;
    data['made_in_city'] = this.madeInCity;
    data['doors'] = this.doors;
    data['fuel_type'] = this.fuelType;
    data['fuel_capacity'] = this.fuelCapacity;
    data['city_mileage'] = this.cityMileage;
    data['highway_mileage'] = this.highwayMileage;
    data['engine'] = this.engine;
    data['engine_size'] = this.engineSize;
    data['engine_cylinders'] = this.engineCylinders;
    data['transmission'] = this.transmission;
    data['transmission_type'] = this.transmissionType;
    data['transmission_speeds'] = this.transmissionSpeeds;
    data['drivetrain'] = this.drivetrain;
    data['anti_brake_system'] = this.antiBrakeSystem;
    data['steering_type'] = this.steeringType;
    data['curb_weight'] = this.curbWeight;
    data['gross_vehicle_weight_rating'] = this.grossVehicleWeightRating;
    data['overall_height'] = this.overallHeight;
    data['overall_length'] = this.overallLength;
    data['overall_width'] = this.overallWidth;
    data['wheelbase_length'] = this.wheelbaseLength;
    data['standard_seating'] = this.standardSeating;
    data['invoice_price'] = this.invoicePrice;
    data['delivery_charges'] = this.deliveryCharges;
    data['manufacturer_suggested_retail_price'] =
        this.manufacturerSuggestedRetailPrice;
    return data;
  }
}

class HistoryData {
  String sId;
  String vIN;
  String vehicleId;
  String auctionId;
  List<VehicleHistory> vehicleHistory;
  int iV;

  HistoryData(
      {this.sId,
        this.vIN,
        this.vehicleId,
        this.auctionId,
        this.vehicleHistory,
        this.iV});

  HistoryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    vIN = json['VIN'];
    vehicleId = json['vehicleId'];
    auctionId = json['auctionId'];
    if (json['vehicleHistory'] != null) {
      vehicleHistory = new List<VehicleHistory>();
      json['vehicleHistory'].forEach((v) {
        vehicleHistory.add(new VehicleHistory.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['VIN'] = this.vIN;
    data['vehicleId'] = this.vehicleId;
    data['auctionId'] = this.auctionId;
    if (this.vehicleHistory != null) {
      data['vehicleHistory'] =
          this.vehicleHistory.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class VehicleHistory {
  String vin;
  String id;
  String date;
  String mode;
  Specs specs;
  List<Titles> titles;
  List<Jsi> jsi;
  List<Sales> sales;
  bool clean;
  String error;
  bool success;

  VehicleHistory(
      {this.vin,
        this.id,
        this.date,
        this.mode,
        this.specs,
        this.titles,
        this.jsi,
        this.sales,
        this.clean,
        this.error,
        this.success});

  VehicleHistory.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    id = json['id'];
    date = json['date'];
    mode = json['mode'];
    specs = json['specs'] != null ? new Specs.fromJson(json['specs']) : null;
    if (json['titles'] != null) {
      titles = new List<Titles>();
      json['titles'].forEach((v) {
        titles.add(new Titles.fromJson(v));
      });
    }

    if (json['jsi'] != null) {
      jsi = new List<Jsi>();
      json['jsi'].forEach((v) {
        jsi.add(new Jsi.fromJson(v));
      });
    }
    if (json['sales'] != null) {
      sales = new List<Sales>();
      json['sales'].forEach((v) {
        sales.add(new Sales.fromJson(v));
      });
    }
    clean = json['clean'];
    error = json['error'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['id'] = this.id;
    data['date'] = this.date;
    data['mode'] = this.mode;
    if (this.specs != null) {
      data['specs'] = this.specs.toJson();
    }
    if (this.titles != null) {
      data['titles'] = this.titles.map((v) => v.toJson()).toList();
    }
    if (this.jsi != null) {
      data['jsi'] = this.jsi.map((v) => v.toJson()).toList();
    }
    if (this.sales != null) {
      data['sales'] = this.sales.map((v) => v.toJson()).toList();
    }
    data['clean'] = this.clean;
    data['error'] = this.error;
    data['success'] = this.success;
    return data;
  }
}

class Specs {
  String vIN;
  String year;
  String make;
  String model;
  String trim;
  String engine;
  String madeIn;
  String style;
  String steeringType;
  String antiBrakeSystem;
  String fuelType;
  String fuelCapacity;
  String grossWeight;
  String overallHeight;
  String overallLength;
  String overallWidth;
  String standardSeating;
  String optionalSeating;
  String highwayMileage;
  String cityMileage;
  String invoicePrice;
  String mSRP;

  Specs(
      {this.vIN,
        this.year,
        this.make,
        this.model,
        this.trim,
        this.engine,
        this.madeIn,
        this.style,
        this.steeringType,
        this.antiBrakeSystem,
        this.fuelType,
        this.fuelCapacity,
        this.grossWeight,
        this.overallHeight,
        this.overallLength,
        this.overallWidth,
        this.standardSeating,
        this.optionalSeating,
        this.highwayMileage,
        this.cityMileage,
        this.invoicePrice,
        this.mSRP});

  Specs.fromJson(Map<String, dynamic> json) {
    vIN = json['VIN'];
    year = json['Year'];
    make = json['Make'];
    model = json['Model'];
    trim = json['Trim'];
    engine = json['Engine'];
    madeIn = json['Made In'];
    style = json['Style'];
    steeringType = json['Steering Type'];
    antiBrakeSystem = json['Anti-Brake System'];
    fuelType = json['Fuel Type'];
    fuelCapacity = json['Fuel Capacity'];
    grossWeight = json['Gross Weight'];
    overallHeight = json['Overall Height'];
    overallLength = json['Overall Length'];
    overallWidth = json['Overall Width'];
    standardSeating = json['Standard Seating'];
    optionalSeating = json['Optional Seating'];
    highwayMileage = json['Highway Mileage'];
    cityMileage = json['City Mileage'];
    invoicePrice = json['Invoice Price'];
    mSRP = json['MSRP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VIN'] = this.vIN;
    data['Year'] = this.year;
    data['Make'] = this.make;
    data['Model'] = this.model;
    data['Trim'] = this.trim;
    data['Engine'] = this.engine;
    data['Made In'] = this.madeIn;
    data['Style'] = this.style;
    data['Steering Type'] = this.steeringType;
    data['Anti-Brake System'] = this.antiBrakeSystem;
    data['Fuel Type'] = this.fuelType;
    data['Fuel Capacity'] = this.fuelCapacity;
    data['Gross Weight'] = this.grossWeight;
    data['Overall Height'] = this.overallHeight;
    data['Overall Length'] = this.overallLength;
    data['Overall Width'] = this.overallWidth;
    data['Standard Seating'] = this.standardSeating;
    data['Optional Seating'] = this.optionalSeating;
    data['Highway Mileage'] = this.highwayMileage;
    data['City Mileage'] = this.cityMileage;
    data['Invoice Price'] = this.invoicePrice;
    data['MSRP'] = this.mSRP;
    return data;
  }
}

class Titles {
  String vin;
  String state;
  String date;
  String meter;
  bool current;

  Titles({this.vin, this.state, this.date, this.meter, this.current});

  Titles.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    state = json['state'];
    date = json['date'];
    meter = json['meter'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['state'] = this.state;
    data['date'] = this.date;
    data['meter'] = this.meter;
    data['current'] = this.current;
    return data;
  }
}

class Jsi {
  String date;
  String branderCode;
  String branderName;
  String branderCity;
  String branderState;
  String branderPhone;
  String branderEmail;
  String recordType;
  String vehicleDisposition;
  String intendedForExport;

  Jsi(
      {this.date,
        this.branderCode,
        this.branderName,
        this.branderCity,
        this.branderState,
        this.branderPhone,
        this.branderEmail,
        this.recordType,
        this.vehicleDisposition,
        this.intendedForExport});

  Jsi.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    branderCode = json['branderCode'];
    branderName = json['branderName'];
    branderCity = json['branderCity'];
    branderState = json['branderState'];
    branderPhone = json['branderPhone'];
    branderEmail = json['branderEmail'];
    recordType = json['recordType'];
    vehicleDisposition = json['vehicleDisposition'];
    intendedForExport = json['intendedForExport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['branderCode'] = this.branderCode;
    data['branderName'] = this.branderName;
    data['branderCity'] = this.branderCity;
    data['branderState'] = this.branderState;
    data['branderPhone'] = this.branderPhone;
    data['branderEmail'] = this.branderEmail;
    data['recordType'] = this.recordType;
    data['vehicleDisposition'] = this.vehicleDisposition;
    data['intendedForExport'] = this.intendedForExport;
    return data;
  }
}

class Sales {
  String vin;
  String date;
  String type;
  String listingPrice;
  String vehicleMileage;
  String vehicleYear;
  String vehicleMake;
  String vehicleModel;
  String vehicleTrim;
  String vehicleColor;
  String sellerType;
  String sellerName;
  String sellerCity;
  String sellerState;
  String sellerZip;

  Sales(
      {this.vin,
        this.date,
        this.type,
        this.listingPrice,
        this.vehicleMileage,
        this.vehicleYear,
        this.vehicleMake,
        this.vehicleModel,
        this.vehicleTrim,
        this.vehicleColor,
        this.sellerType,
        this.sellerName,
        this.sellerCity,
        this.sellerState,
        this.sellerZip});

  Sales.fromJson(Map<String, dynamic> json) {
    vin = json['vin'];
    date = json['date'];
    type = json['type'];
    listingPrice = json['listingPrice'];
    vehicleMileage = json['vehicleMileage'];
    vehicleYear = json['vehicleYear'];
    vehicleMake = json['vehicleMake'];
    vehicleModel = json['vehicleModel'];
    vehicleTrim = json['vehicleTrim'];
    vehicleColor = json['vehicleColor'];
    sellerType = json['sellerType'];
    sellerName = json['sellerName'];
    sellerCity = json['sellerCity'];
    sellerState = json['sellerState'];
    sellerZip = json['sellerZip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vin'] = this.vin;
    data['date'] = this.date;
    data['type'] = this.type;
    data['listingPrice'] = this.listingPrice;
    data['vehicleMileage'] = this.vehicleMileage;
    data['vehicleYear'] = this.vehicleYear;
    data['vehicleMake'] = this.vehicleMake;
    data['vehicleModel'] = this.vehicleModel;
    data['vehicleTrim'] = this.vehicleTrim;
    data['vehicleColor'] = this.vehicleColor;
    data['sellerType'] = this.sellerType;
    data['sellerName'] = this.sellerName;
    data['sellerCity'] = this.sellerCity;
    data['sellerState'] = this.sellerState;
    data['sellerZip'] = this.sellerZip;
    return data;
  }
}
