import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/utils/vars.dart';

import 'api_exception.dart';

class ApiOrder {
  ApiOrder._();

  static final ApiOrder instance = ApiOrder._();
  static OrderModel order;

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

  Future<OrderModel> makeOrder(String phone, String email, String address,
      String city, String paymentMethod, double totalPrice) async {
    // Json Data
    var _data = {
      "customers_telephone": phone,
      "email": email,
      "delivery_street_address": address,
      "delivery_city": city,
      "payment_method": 'cash_on_delivery',
      "payment_status": 1,
      "totalPrice": totalPrice,
      "currency_code": "SAR",
      "total_tax": 0.0,
      "language_id": 1,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.OrderMake,
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
      order = OrderModel.fromJson(_response.data);
      return order;
      // categories = AllCategoriesModel.fromJson(_response.data);
      //return categories;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....make order***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<OrderModel> getOrder() async {
    String token = await _getUserToken();
    // Json Data
    var _data = {
      "language_id": 1,
    };
    var _response = await dio.post(ServerConstants.Order_List,
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
      order = OrderModel.fromJson(_response.data);
      return order;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....get order***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<OrderModel> cancelOrder(int ordersId) async {
    // Json Data
    var _data = {
      "orders_id": ordersId,
      "comment": "nsbdjasd",
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Order_Cancel,
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
      order = OrderModel.fromJson(_response.data);
      return order;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....cancel order***********************************************************');

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
