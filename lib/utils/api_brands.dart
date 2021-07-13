import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_app/models/all_categories.dart';
import 'package:shop_app/models/brands.dart';
import 'package:shop_app/utils/vars.dart';

import 'api_exception.dart';

class ApiBrands {
  ApiBrands._();

  static final ApiBrands instance = ApiBrands._();
  static BrandsModel brandsModel;

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

  Future<BrandsModel> brands() async {
    // Json Data
    var _data = {
      "language_id": 1,
    };
    var _response = await dio.post(ServerConstants.Brands,
        data: _data,
        options: Options(
          headers: {...apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      brandsModel = BrandsModel.fromJson(_response.data);
      return brandsModel;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....brands***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}