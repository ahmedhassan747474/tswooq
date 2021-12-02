import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/category_like_card.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/models/payment.dart';
import 'package:tswooq/models/producr_like_card.dart';
import 'package:tswooq/models/slider_model.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/models/vendor_be_come.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiVendor {
  ApiVendor._();

  static final ApiVendor instance = ApiVendor._();
  SlidersModel slider = new SlidersModel();
  var dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Future<VendorsModel> getVendor() async {
    // Json Data

    var _response = await dio.get(ServerConstants.getVendors,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return VendorsModel.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<VendorBeCome> getVendorBouquet() async {
    // Json Data

    var _response = await dio.get(ServerConstants.becomeMerchant,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return VendorBeCome.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<Autogenerated> checkoutVendor(var _data) async {
    // Json Data
    // var _data = {"package_id": "1", " price": "300", "month": "12"};
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.checkout,
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
      return Autogenerated.fromJson(_response.data);
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

Future<String> _getUserToken() async {
  print('_getUserToken()');
  UserModel user = UserModel();
  print('UserModel');

  String userToken = await user.getToken;
  print(userToken);
  if (userToken == null) throw "User Not Logged In";
  return userToken;
}
