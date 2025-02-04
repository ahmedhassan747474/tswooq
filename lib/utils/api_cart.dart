import 'package:dio/dio.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/Cart.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiCart {
  ApiCart._();

  static final ApiCart instance = ApiCart._();
  static CartModel cart;

  Future<void> addToCart(var _data) async {
    // Json Data
    // var _data = ;
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Add_Cart,
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
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.Get_Cart,
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

  Future<CartModel> getCartLike() async {
    String token = await _getUserToken();
    // Json Data
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.get_cart_like,
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

      return CartModel.fromJson(_response.data);
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
            ...ServerConstants.apiHeaders,
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

  Future<void> addToPos() async {
    // Json Data

    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.addtopos,
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
