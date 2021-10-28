import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiCategories {
  ApiCategories._();

  static final ApiCategories instance = ApiCategories._();
  static AllCategoriesModel categories;

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

  Future<AllCategoriesModel> allCategories() async {
    // Json Data
    var _data = {
      "language_id": 2,
    };
    var _response = await dio.post(ServerConstants.AllCategories,
        data: _data,
        options: Options(
          headers: {
            ...apiHeaders,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      categories = AllCategoriesModel.fromJson(_response.data);
      return categories;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allCategories***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}
