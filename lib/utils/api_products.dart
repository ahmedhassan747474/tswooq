import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/fav_model.dart';
import 'package:tswooq/models/get_product.dart';
import 'package:tswooq/models/products.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiProducts {
  ApiProducts._();

  static final ApiProducts instance = ApiProducts._();
  static ProductsModel products;
  static FavModel fav;
  static SearchProduct searchProduct;

  Future<ProductsModel> getProducts(int page) async {
    // Json Data
    var _data = {
      "language_id": helpLanguage == 'ar' ? 2 : 1,
      "page": page,
      "limit": 20,
    };
    var _response = await dio.post(ServerConstants.Products,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
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

  Future<ProductsModel> getProductsByCategory(int id, int page) async {
    // Json Data
    var _data = {
      "language_id": helpLanguage == 'en' ? 1 : 2,
      // "limit": 100,
      "page": page,
      "categories_id": id
    };
    var _response = await dio.post(ServerConstants.Products_By_Category,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
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

  Future<GetProduct> getProductsById(int id) async {
    // Json Data
    var _data = {"language_id": 1, "limit": 100, "page": 1, "id": id};
    var _response = await dio.post(ServerConstants.getproductbyid,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return GetProduct.fromJson(_response.data);
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
    var _data = {"language_id": 1, "limit": 100, "page": 1, "brand_id": id};
    var _response = await dio.post(ServerConstants.getproductbyid,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
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

  Future<ProductsModel> filter(
    int pageNumber,
    int minPrice,
    int maxPrice,
  ) async {
    // Json Data
    var _data = {
      "page_number": pageNumber,
      "minPrice": minPrice,
      "maxPrice": maxPrice,
      "language_id": helpLanguage == 'ar' ? 2 : 1,
      "current_currency": "SAR",
      "currency_code": "SAR",
      "filters[0][name]": "Memory",
      "filters[0][value]": "64GB"
    };
    var _response = await dio.post(ServerConstants.search,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
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

  Future<SearchProduct> search(String search) async {
    // Json Data
    var _data = {
      "page_number": 1,
      "minPrice": 0,
      "maxPrice": 10000000,
      // "language_id": helpLanguage == 'ar' ? 2 : 1,
      "language_id": 2,
      "current_currency": "SAR",
      "currency_code": "SAR",
      "search": search
    };
    var _response = await dio.post(ServerConstants.search,
        data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      searchProduct = SearchProduct.fromJson(_response.data);
      return searchProduct;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<void> likeProduct(int productId) async {
    // Json Data
    var _data = {
      "product_id": productId,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Like_Product,
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
      // products = ProductsModel.fromJson(_response.data);
      // return products;
      // categories = AllCategoriesModel.fromJson(_response.data);
      //return categories;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....like***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<void> unLikeProduct(int productId) async {
    // Json Data
    var _data = {
      "product_id": productId,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.UnLike_Product,
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

      // categories = AllCategoriesModel.fromJson(_response.data);
      //return categories;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....like***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<SearchProduct> getFav() async {
    // Json Data
    var _data = {
      "language_id": helpLanguage == 'ar' ? 2 : 1,
      "page": 1,
      "limit": 30,
    };
    String token = await _getUserToken();
    var _response = await dio.post(ServerConstants.Get_Fav,
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

      return SearchProduct.fromJson(_response.data);
      // categories = AllCategoriesModel.fromJson(_response.data);
      //return categories;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....fav***********************************************************');

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
