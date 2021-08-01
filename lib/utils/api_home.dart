import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app/models/slider_model.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/utils/vars.dart';

import 'api_exception.dart';

class ApiHome {
  ApiHome._();

  static final ApiHome instance = ApiHome._();
  SlidersModel slider = new SlidersModel();
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

  Future<SlidersModel> getSlider() async {
    // Json Data

    var _response = await dio.post(ServerConstants.getSliders,
        // data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      slider = SlidersModel.fromJson(_response.data);
      return slider;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

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
