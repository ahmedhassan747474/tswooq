import 'package:dio/dio.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiCategories {
  ApiCategories._();

  static final ApiCategories instance = ApiCategories._();
  static AllCategoriesModel categories;

  Future<AllCategoriesModel> allCategories() async {
    // int x= helpLanguage == 'ar' ? 2 : 1;
    // Json Data
    var _data = {"language_id": helpLanguage == 'ar' ? 2 : 1};
    var _response = await dio.post(ServerConstants.AllCategories,
        data: _data,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return AllCategoriesModel.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allCategories***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<AllCategoriesModel> getCategoryByVendor(int id) async {
    // int x= helpLanguage == 'ar' ? 2 : 1;
    // Json Data
    var _response = await dio.get(ServerConstants.get_category_by_vendor,
        queryParameters: {"vendor_id": id},
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return AllCategoriesModel.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allCategories***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<AllCategoriesModel> allBrand(int id) async {
    // int x= helpLanguage == 'ar' ? 2 : 1;
    // Json Data
    var _data = {
      "category_id": id,
      "language_id": helpLanguage == 'ar' ? 2 : 1
    };

    var _response = await dio.post(ServerConstants.get_brands_by_category,
        data: _data,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return AllCategoriesModel.fromJson(_response.data);
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
