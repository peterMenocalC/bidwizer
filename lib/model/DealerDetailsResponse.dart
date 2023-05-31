class DealerDetailsResponse {
  int status;
  Data data;
  String message;

  DealerDetailsResponse({this.status, this.data, this.message});

  DealerDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String userName;
  String role;
  String dealerNo;
  String busneissTitleRole;
  String sId;
  String firstName;
  String lastName;
  String email;
  String mobile;
  String emailVerified;
  int iV;
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

  Data(
      {this.userName,
        this.role,
        this.dealerNo,
        this.busneissTitleRole,
        this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.emailVerified,
        this.iV,
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
        this.zip});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    role = json['role'];
    dealerNo = json['dealerNo'];
    busneissTitleRole = json['busneissTitleRole'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerified = json['email_verified'];
    iV = json['__v'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    accountType = json['account_type'];
    address1 = json['address1'];
    address2 = json['address2'];
    authorizedRepresentative = json['authorizedRepresentative'];
    busneissTitle = json['busneissTitle'];
    city = json['city'];
    cleanTitle = json['clean_title'];
    deleted = json['deleted'];
    driversLicenseNumber = json['drivers_license_number'];
    emailCompany = json['email_company'];
    fllorPlanCompanyName = json['fllor_plan_company_name'];
    floorPlanContactEmail = json['floor_plan_contact_email'];
    floorPlanMainContact = json['floor_plan_main_contact'];
    isDelete = json['is_delete'];
    phoneNumber = json['phone_number'];
    phoneNumberExt = json['phone_number_ext'];
    phoneNumberOffice = json['phone_number_office'];
    phoneNumberOfficeExt = json['phone_number_office_ext'];
    routingNumber = json['routing_number'];
    state = json['state'];
    termsAndConditions = json['terms_and_conditions'];
    userId = json['userId'];
    userNo = json['userNo'];
    usersLogo = json['users_logo'];
    website = json['website'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['role'] = this.role;
    data['dealerNo'] = this.dealerNo;
    data['busneissTitleRole'] = this.busneissTitleRole;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified'] = this.emailVerified;
    data['__v'] = this.iV;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['account_type'] = this.accountType;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['authorizedRepresentative'] = this.authorizedRepresentative;
    data['busneissTitle'] = this.busneissTitle;
    data['city'] = this.city;
    data['clean_title'] = this.cleanTitle;
    data['deleted'] = this.deleted;
    data['drivers_license_number'] = this.driversLicenseNumber;
    data['email_company'] = this.emailCompany;
    data['fllor_plan_company_name'] = this.fllorPlanCompanyName;
    data['floor_plan_contact_email'] = this.floorPlanContactEmail;
    data['floor_plan_main_contact'] = this.floorPlanMainContact;
    data['is_delete'] = this.isDelete;
    data['phone_number'] = this.phoneNumber;
    data['phone_number_ext'] = this.phoneNumberExt;
    data['phone_number_office'] = this.phoneNumberOffice;
    data['phone_number_office_ext'] = this.phoneNumberOfficeExt;
    data['routing_number'] = this.routingNumber;
    data['state'] = this.state;
    data['terms_and_conditions'] = this.termsAndConditions;
    data['userId'] = this.userId;
    data['userNo'] = this.userNo;
    data['users_logo'] = this.usersLogo;
    data['website'] = this.website;
    data['zip'] = this.zip;
    return data;
  }
}
