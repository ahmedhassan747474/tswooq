import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/utils/vars.dart';

import 'api_exception.dart';

class ApiProducts {
  ApiProducts._();

  static final ApiProducts instance = ApiProducts._();
  static ProductsModel products;

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

  Future<ProductsModel> getProducts() async {
    // Json Data
    var _data = {
      "language_id": 1,
      "page": 1,
      "limit": 20,
    };
    var _response = await dio.post(ServerConstants.Products,
        data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      products = ProductsModel.fromJson(_response.data);
      return products;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<ProductsModel> getProductsByCategory(int id) async {
    // Json Data
    var _data = {
      "language_id": 1,
      "limit": 100,
      "page": 1,
      "category_id": id

    };
    var _response = await dio.post(ServerConstants.Products_By_Category,
        data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      products = ProductsModel.fromJson(_response.data);
      return products;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
  Future<ProductsModel> getProductsByBrand(int id) async {
    // Json Data
    var _data = {
      "language_id": 1,
      "limit": 100,
      "page": 1,
      "brand_id": id

    };
    var _response = await dio.post(ServerConstants.Products_By_Brand,
        data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      products = ProductsModel.fromJson(_response.data);
      return products;
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


