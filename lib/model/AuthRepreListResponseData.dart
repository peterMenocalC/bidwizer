class AuthRepreListResponseData {
  List<AuthRepreListResponseDataData> data;
  int status;
  String message;

  AuthRepreListResponseData({this.data, this.status, this.message});

  AuthRepreListResponseData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(new AuthRepreListResponseDataData.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class AuthRepreListResponseDataData {
  String userNo;
  String userName;
  String role;
  String dealerNo;
  String driversLicenseNumber;
  String cleanTitle;
  String accountHolderName;
  String accountType;
  String routingNumber;
  String accountNumber;
  String termsAndConditions;
  String address1;
  String address2;
  String city;
  String state;
  String zip;
  String usersLogo;
  String busneissTitle;
  String busneissTitleRole;
  String lastName;
  String isDelete;
  String website;
  String emailCompany;
  String phoneNumberOffice;
  String phoneNumberOfficeExt;
  String fllorPlanCompanyName;
  String floorPlanMainContact;
  String floorPlanContactEmail;
  bool deleted;
  String sId;
  String businessTitle;
  String firstName;
  String email;
  String phoneNumber;
  String phoneNumberExt;
  String mobile;
  String emailVerified;
  bool authorizedRepresentative;
  String dealerId;
  String profileImageURL;
  int iV;
  String fullName;

  AuthRepreListResponseDataData(
      {this.userNo,
        this.userName,
        this.role,
        this.dealerNo,
        this.driversLicenseNumber,
        this.cleanTitle,
        this.accountHolderName,
        this.accountType,
        this.routingNumber,
        this.accountNumber,
        this.termsAndConditions,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.zip,
        this.usersLogo,
        this.busneissTitle,
        this.busneissTitleRole,
        this.lastName,
        this.isDelete,
        this.website,
        this.emailCompany,
        this.phoneNumberOffice,
        this.phoneNumberOfficeExt,
        this.fllorPlanCompanyName,
        this.floorPlanMainContact,
        this.floorPlanContactEmail,
        this.deleted,
        this.sId,
        this.businessTitle,
        this.firstName,
        this.email,
        this.phoneNumber,
        this.phoneNumberExt,
        this.mobile,
        this.emailVerified,
        this.authorizedRepresentative,
        this.dealerId,
        this.profileImageURL,
        this.iV, this.fullName});

  AuthRepreListResponseDataData.fromJson(Map<String, dynamic> json) {
    userNo = json['userNo'];
    userName = json['userName'];
    role = json['role'];
    dealerNo = json['dealerNo'];
    driversLicenseNumber = json['drivers_license_number'];
    cleanTitle = json['clean_title'];
    accountHolderName = json['account_holder_name'];
    accountType = json['account_type'];
    routingNumber = json['routing_number'];
    accountNumber = json['account_number'];
    termsAndConditions = json['terms_and_conditions'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    usersLogo = json['users_logo'];
    busneissTitle = json['busneissTitle'];
    busneissTitleRole = json['busneissTitleRole'];
    lastName = json['lastName'];
    isDelete = json['is_delete'];
    website = json['website'];
    emailCompany = json['email_company'];
    phoneNumberOffice = json['phone_number_office'];
    phoneNumberOfficeExt = json['phone_number_office_ext'];
    fllorPlanCompanyName = json['fllor_plan_company_name'];
    floorPlanMainContact = json['floor_plan_main_contact'];
    floorPlanContactEmail = json['floor_plan_contact_email'];
    deleted = json['deleted'];
    sId = json['_id'];
    businessTitle = json['businessTitle'];
    firstName = json['firstName'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    phoneNumberExt = json['phone_number_ext'];
    mobile = json['mobile'];
    emailVerified = json['email_verified'];
    authorizedRepresentative = json['authorizedRepresentative'];
    dealerId = json['dealerId'];
    profileImageURL = json['profileImageURL'];
    iV = json['__v'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userNo'] = this.userNo;
    data['userName'] = this.userName;
    data['role'] = this.role;
    data['dealerNo'] = this.dealerNo;
    data['drivers_license_number'] = this.driversLicenseNumber;
    data['clean_title'] = this.cleanTitle;
    data['account_holder_name'] = this.accountHolderName;
    data['account_type'] = this.accountType;
    data['routing_number'] = this.routingNumber;
    data['account_number'] = this.accountNumber;
    data['terms_and_conditions'] = this.termsAndConditions;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['users_logo'] = this.usersLogo;
    data['busneissTitle'] = this.busneissTitle;
    data['busneissTitleRole'] = this.busneissTitleRole;
    data['lastName'] = this.lastName;
    data['is_delete'] = this.isDelete;
    data['website'] = this.website;
    data['email_company'] = this.emailCompany;
    data['phone_number_office'] = this.phoneNumberOffice;
    data['phone_number_office_ext'] = this.phoneNumberOfficeExt;
    data['fllor_plan_company_name'] = this.fllorPlanCompanyName;
    data['floor_plan_main_contact'] = this.floorPlanMainContact;
    data['floor_plan_contact_email'] = this.floorPlanContactEmail;
    data['deleted'] = this.deleted;
    data['_id'] = this.sId;
    data['businessTitle'] = this.businessTitle;
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['phone_number_ext'] = this.phoneNumberExt;
    data['mobile'] = this.mobile;
    data['email_verified'] = this.emailVerified;
    data['authorizedRepresentative'] = this.authorizedRepresentative;
    data['dealerId'] = this.dealerId;
    data['profileImageURL'] = this.profileImageURL;
    data['__v'] = this.iV;
    data['fullName'] = this.fullName;
    return data;
  }
}
