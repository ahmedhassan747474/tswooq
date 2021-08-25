import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  String token;
  User data;
  int statusCode;

  UserModel({this.token, this.data, this.statusCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    saveToken(json['token']);
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    statusCode = json['status_code'];
  }
  Future<void> resetUser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.clear();
  }

  Future<void> saveToken(String token) async {
    this.token = token;
    print("$token");
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.setString('access_token', 'Bearer $token');
  }

  Future<String> get getToken async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    print('get token');
    print(_pref.getString('access_token'));
    return _pref.getString('access_token');
  }

  Future<bool> get isLoggedIn async {
    // if token found , user loggedIn,
    return await getToken != null;
  }

  Future<void> removeToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();
    // return _pref.setString('access_token', 'Bearer $token');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status_code'] = this.statusCode;
    return data;
  }
}

class User {
  int id;
  String name;
  String firstName;
  String lastName;
  String gender;
  int defaultAddressId;
  String countryCode;
  String phone;
  String email;
  String emailActivate;
  String activeEmailToken;
  String avatar;
  String status;
  int isSeen;
  int phoneVerified;
  String rememberToken;
  String authIdTiwilo;
  String dateOfBirth;
  String parentAdminId;
  String shopName;
  String tokenFcm;
  String providerGoogleId;
  String providerFacebookId;
  String providerTwitterId;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.gender,
      this.defaultAddressId,
      this.countryCode,
      this.phone,
      this.email,
      this.emailActivate,
      this.activeEmailToken,
      this.avatar,
      this.status,
      this.isSeen,
      this.phoneVerified,
      this.rememberToken,
      this.authIdTiwilo,
      this.dateOfBirth,
      this.parentAdminId,
      this.shopName,
      this.tokenFcm,
      this.providerGoogleId,
      this.providerFacebookId,
      this.providerTwitterId,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? -1;
    name = json['name'] ?? "";
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    gender = json['gender'] ?? "";
    defaultAddressId = json['default_address_id'] ?? -1;
    countryCode = json['country_code'] ?? "";
    phone = json['phone'] ?? "";
    email = json['email'] ?? "";
    emailActivate = json['email_activate'] ?? "";
    activeEmailToken = json['active_email_token'] ?? "";
    avatar = json['avatar'] ?? "";
    status = json['status'] ?? "";
    isSeen = json['is_seen'] ?? -1;
    phoneVerified = json['phone_verified'] ?? -1;
    rememberToken = json['remember_token'] ?? "";
    authIdTiwilo = json['auth_id_tiwilo'] ?? "";
    dateOfBirth = json['date_of_birth'] ?? "";
    parentAdminId = json['parent_admin_id'] ?? "";
    shopName = json['shop_name'] ?? "";
    tokenFcm = json['token_fcm'] ?? "";
    providerGoogleId = json['provider_google_id'] ?? "";
    providerFacebookId = json['provider_facebook_id'] ?? "";
    providerTwitterId = json['provider_twitter_id'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['default_address_id'] = this.defaultAddressId;
    data['country_code'] = this.countryCode;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_activate'] = this.emailActivate;
    data['active_email_token'] = this.activeEmailToken;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['is_seen'] = this.isSeen;
    data['phone_verified'] = this.phoneVerified;
    data['remember_token'] = this.rememberToken;
    data['auth_id_tiwilo'] = this.authIdTiwilo;
    data['date_of_birth'] = this.dateOfBirth;
    data['parent_admin_id'] = this.parentAdminId;
    data['shop_name'] = this.shopName;
    data['token_fcm'] = this.tokenFcm;
    data['provider_google_id'] = this.providerGoogleId;
    data['provider_facebook_id'] = this.providerFacebookId;
    data['provider_twitter_id'] = this.providerTwitterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
