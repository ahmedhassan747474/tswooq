import 'package:dio/dio.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/brands.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiBrands {
  ApiBrands._();

  static final ApiBrands instance = ApiBrands._();
  static BrandsModel brandsModel;

  //
  // static const Map<String, String> apiHeaders = {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json, text/plain, */*",
  //   "Access-Control_Allow_Origin": "*"
  // };

  Future<BrandsModel> brands() async {
    // Json Data
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.Brands,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
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
