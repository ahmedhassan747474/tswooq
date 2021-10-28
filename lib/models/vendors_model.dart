class VendorsModel {
  List<Vendor> data;

  VendorsModel({this.data});

  VendorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Vendor>();
      json['data'].forEach((v) {
        data.add(new Vendor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vendor {
  int id;
  int roleId;
  String userName;
  String firstName;
  String lastName;
  String gender;
  int defaultAddressId;
  String countryCode;
  String phone;
  String email;
  String avatar;
  String recordNumber;
  String status;
  int isSeen;
  int phoneVerified;
  String authIdTiwilo;
  String dob;
  int parentAdminId;
  String shopName;
  String emailActivate;
  String activeEmailToken;
  String token;
  String subscriptionFee;
  String startDate;
  String endDate;
  String providerGoogleId;
  String providerFacebookId;
  String providerTwitterId;
  String createdAt;
  String updatedAt;

  Vendor(
      {this.id,
      this.roleId,
      this.userName,
      this.firstName,
      this.lastName,
      this.gender,
      this.defaultAddressId,
      this.countryCode,
      this.phone,
      this.email,
      this.avatar,
      this.recordNumber,
      this.status,
      this.isSeen,
      this.phoneVerified,
      this.authIdTiwilo,
      this.dob,
      this.parentAdminId,
      this.shopName,
      this.emailActivate,
      this.activeEmailToken,
      this.token,
      this.subscriptionFee,
      this.startDate,
      this.endDate,
      this.providerGoogleId,
      this.providerFacebookId,
      this.providerTwitterId,
      this.createdAt,
      this.updatedAt});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    defaultAddressId = json['default_address_id'];
    countryCode = json['country_code'];
    phone = json['phone'];
    email = json['email'];
    avatar = json['avatar'];
    recordNumber = json['record_number'];
    status = json['status'];
    isSeen = json['is_seen'];
    phoneVerified = json['phone_verified'];
    authIdTiwilo = json['auth_id_tiwilo'];
    dob = json['dob'];
    parentAdminId = json['parent_admin_id'];
    shopName = json['shop_name'];
    emailActivate = json['email_activate'];
    activeEmailToken = json['active_email_token'];
    token = json['token'];
    subscriptionFee = json['subscription_fee'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    providerGoogleId = json['provider_google_id'];
    providerFacebookId = json['provider_facebook_id'];
    providerTwitterId = json['provider_twitter_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['default_address_id'] = this.defaultAddressId;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['record_number'] = this.recordNumber;
    data['status'] = this.status;
    data['is_seen'] = this.isSeen;
    data['phone_verified'] = this.phoneVerified;
    data['auth_id_tiwilo'] = this.authIdTiwilo;
    data['dob'] = this.dob;
    data['parent_admin_id'] = this.parentAdminId;
    data['shop_name'] = this.shopName;
    data['email_activate'] = this.emailActivate;
    data['active_email_token'] = this.activeEmailToken;
    data['token'] = this.token;
    data['subscription_fee'] = this.subscriptionFee;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['provider_google_id'] = this.providerGoogleId;
    data['provider_facebook_id'] = this.providerFacebookId;
    data['provider_twitter_id'] = this.providerTwitterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
