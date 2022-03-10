import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tswooq/models/updata_model.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();
  static UserModel user;

  Future<UserModel> register(
      String email, String password, String confirmPassword) async {
    // Json Data
    var _data = {
      "email": "$email",
      "password": "$password",
      "password_confirmation": confirmPassword,
    };
    var _response = await dio.post(ServerConstants.Register,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      user = UserModel.fromJsonWithToken(_response.data);
      return user;
    } else {
      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

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
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      user = UserModel.fromJsonWithToken(_response.data);
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
            ...ServerConstants.apiHeaders,
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
      // No Success
      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<Update> checkUpdate() async {
    // User Token
    String token = await _getUserToken();
    var _response = await dio.get(ServerConstants.getUpdates,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
            'Authorization': token,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK

      return Update.fromJson(_response.data);
    } else {
      // No Success
      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<UserModel> editProfile(String phone, XFile image, String userName,
      String firstName, String lastName, String email) async {
    // Json Data

    FormData _formData;

    if (image == null)
      _formData = FormData.fromMap({
        "user_name": "$userName",
        "first_name": "$firstName",
        "last_name": "$lastName",
        "phone": "$phone",
        "email": "$email",
      });
    else {
      _formData = FormData.fromMap({
        "user_name": "$userName",
        "first_name": "$firstName",
        "last_name": "$lastName",
        "phone": "$phone",
        "email": "$email",
        'image': await MultipartFile.fromFile('${image.path}')
      });
    }
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Update_profile,
        data: _formData,
        options: Options(
          responseType: ResponseType.json,
          headers: {
            ...ServerConstants.apiHeaders,
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
      // No Success
      print(
          'ApiException....edit profile***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<UserModel> changePassword(
      String oldPass, String newPass, String passwordConfirmation) async {
    // Json Data
    var _data = {
      "old_password": "$oldPass",
      "new_password": "$newPass",
      "new_password_confirmation": "$passwordConfirmation",
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Change_Password,
        data: _data,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
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
      // No Success
      print(
          'ApiException....change pass***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<UserModel> forgetPassword(String email) async {
    // String token = await _getUserToken();
    var _data = {
      "email": "$email",
    };
    var _response = await dio.post(ServerConstants.Forget_Password,
        data: _data,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
            // 'Authorization': token,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      // user = UserModel.fromJson(_response.data);
      throw ApiException.fromApi(_response.statusCode, _response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....forgetPass***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Helpers Functions /////////////////////////////

Future<String> _getUserToken() async {
  print('_getUserToken()');
  UserModel user = UserModel();
  print('UserModel');

  String userToken = await user.getToken;
  print(userToken);
  // if (userToken == null) throw "User Not Logged In";
  return userToken;
}
