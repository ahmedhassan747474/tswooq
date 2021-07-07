import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/utils/vars.dart';

import 'api_exception.dart';

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();
  static UserModel user;

  var dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  //
  static const Map<String, String> apiHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json, text/plain, */*",
    // "X-Requested-With": "XMLHttpRequest",
  };

  Future<UserModel> login(String email, String password) async {
    // Json Data
    var _data = {
      "email": "$email",
      "password": "$password",
      "token": "firebase",
    };
    var _response = await dio.post(ServerConstants.Login,
        data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      user = UserModel.fromJson(_response.data);
      return user;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....login***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<UserModel> getProfile() async {
    // User Token
    String token = await _getUserToken();
    var _response = await dio.get(ServerConstants.get_profile,
        options: Options(
          headers: {
            ...apiHeaders,
            'Authorization': token,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      user = UserModel.fromJson(_response.data);
      return user;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....login***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Helpers Functions /////////////////////////////

//Future<Map<String, String>> _getFirebaseToken() async {
// // String token = await FirebaseMessaging().getToken();
//  return <String, String>{"DeviceToken": token};
//}

Future<String> _getUserToken() async {
  print('_getUserToken()');
  UserModel user = UserModel();
  print('UserModel');

  String userToken = await user.getToken;
  print(userToken);
  if (userToken == null) throw "User Not Logged In";
  return userToken;
}
