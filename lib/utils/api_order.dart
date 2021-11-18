import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/order.dart';
import 'package:tswooq/models/payment_method.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/vars.dart';

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
  // static const Map<String, String> apiHeaders = {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json, text/plain, */*",
  //   // "X-Requested-With": "XMLHttpRequest",
  //   "Access-Control_Allow_Origin": "*"
  // };

  Future<OrderModel> makeOrder(
      {String phone,
      String email,
      String address,
      String city,
      String paymentMethod,
      double totalPrice,
      String comments,
      File image,
      String bankNumber}) async {
    // Json Data
    UserModel user = ApiProvider.user;

    FormData _formData;
    if (paymentMethod == 'cash_on_delivery') {
      _formData = FormData.fromMap({
        'delivery_firstname': '${user.data.firstName}',
        'delivery_lastname': '${user.data.lastName}',
        "customers_telephone": phone,
        "email": email,
        "delivery_street_address": address,
        "delivery_city": city,
        "payment_method": 'cash_on_delivery',
        "payment_status": 1,
        "totalPrice": totalPrice,
        "currency_code": "SAR",
        "total_tax": 0.0,
        "language_id": helpLanguage == 'ar' ? 2 : 1,
        "comments": "$comments",
      });
    } else {
      _formData = FormData.fromMap({
        'delivery_firstname': '${user.data.firstName}',
        'delivery_lastname': '${user.data.lastName}',
        "customers_telephone": phone,
        "email": email,
        "delivery_street_address": address,
        "delivery_city": city,
        "payment_method": 'bank_account',
        "payment_status": 1,
        "totalPrice": totalPrice,
        "currency_code": "SAR",
        "total_tax": 0.0,
        "language_id": helpLanguage == 'ar' ? 2 : 1,
        "comments": "$comments",
        "bank_account_image": await MultipartFile.fromFile('${image.path}'),
        "bank_account_iban": "$bankNumber",
      });
    }
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.OrderMake,
        data: _formData,
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

  Future<OrderModel> makeOrderByVisa(
    String phone,
    String email,
    String address,
    String city,
    String paymentMethod,
    double totalPrice,
    String bankAccountIban,
    File bankAccountImage,
  ) async {
    String fileName = bankAccountImage.path.split('/').last;
    // Json Data
    FormData _formData;

    if (bankAccountImage == null)
      _formData = FormData.fromMap({
        "customers_telephone": phone,
        "email": email,
        "delivery_street_address": address,
        "delivery_city": city,
        "payment_method": 'cash_on_delivery',
        "payment_status": 1,
        "totalPrice": totalPrice,
        "currency_code": "SAR",
        "total_tax": 0.0,
        "bank_account_iban": bankAccountIban,
        "language_id": helpLanguage == 'ar' ? 2 : 1
      });
    else {
      _formData = FormData.fromMap({
        "customers_telephone": phone,
        "email": email,
        "delivery_street_address": address,
        "delivery_city": city,
        "payment_method": 'cash_on_delivery',
        "payment_status": 1,
        "totalPrice": totalPrice,
        "currency_code": "SAR",
        "total_tax": 0.0,
        "bank_account_image": bankAccountImage,
        "bank_account_iban": bankAccountIban,
        "language_id": helpLanguage == 'ar' ? 2 : 1
      });
    }
    ;
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.OrderMake,
        data: _formData,
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

  Future<PaymentMethodModel> getMethod() async {
    // String token = await _getUserToken();
    // Json Data
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.PaymentMethodModel,
        // data: _data,
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

      return PaymentMethodModel.fromJson(_response.data);
    } else {
      print('ApiException....get order************************');
      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<OrderModel> getOrder() async {
    String token = await _getUserToken();
    // Json Data
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.Order_List,
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
            ...ServerConstants.apiHeaders,
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
