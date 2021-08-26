import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/models/Cart.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiCart {
  ApiCart._();

  static final ApiCart instance = ApiCart._();
  static CartModel cart;

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

  Future<void> addToCart(int productId, int quantity) async {
    // Json Data
    var _data = {
      "product_id": productId,
      "quantity": quantity,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Add_Cart,
        data: _data,
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

    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....addCart***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<CartModel> getCart() async {
    String token = await _getUserToken();
    // Json Data
    var _data = {
      "language_id": 1,
    };
    var _response = await dio.post(ServerConstants.Get_Cart,
        data: _data,
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
      cart = CartModel.fromJson(_response.data);
      return cart;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allCategories***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<void> removeCart(int productId) async {
    // Json Data
    var _data = {
      "product_id": productId,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.remove_Cart,
        data: _data,
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
      //  cart = CartModel.fromJson(_response.data);
      // return cart;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....removeCart***********************************************************');

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
