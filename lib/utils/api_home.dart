import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/category_like_card.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/models/producr_like_card.dart';
import 'package:tswooq/models/slider_model.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiHome {
  ApiHome._();

  static final ApiHome instance = ApiHome._();
  SlidersModel slider = new SlidersModel();
  var dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  Future<SlidersModel> getSlider() async {
    // Json Data

    var _response = await dio.post(ServerConstants.getSliders,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      slider = SlidersModel.fromJson(_response.data);
      return slider;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<VendorsModel> getVendor() async {
    // Json Data

    var _response = await dio.get(ServerConstants.getVendors,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      return VendorsModel.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<GroupModel> getGroups({String id}) async {
    // Json Data
//?vendor_id=3
    String s = id;
    if (s == null) s = "";
    var _response = await dio.get(ServerConstants.getGroup + s,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK

      return GroupModel.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<CategoriesLikeCard> likeCardCategory() async {
    // Json Data

    var _response = await dio.post(ServerConstants.get_like_card_categories,
        // data: _data,
        options: Options(
          headers: {...ServerConstants.apiHeaders},
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK

      return CategoriesLikeCard.fromJson(_response.data);
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....allProducts***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }

  Future<ProductLikeCard> likeCardProduct(String id) async {
    // Json Data
    var _data = {
      'poscategory': "$id",
      'possubcategory': "all",
    };
    var _response = await dio.post(ServerConstants.productLikeCard,
        data: _data,
        options: Options(
          headers: {
            ...ServerConstants.apiHeaders,
            "language_id": helpLanguage == 'ar' ? 2 : 1
          },
          validateStatus: (status) {
            return status < 500;
          },
        ));
    if (ServerConstants.isValidResponse(_response.statusCode)) {
      // OK
      if (_response.data["response"] == 0) return ProductLikeCard(data: []);
      return ProductLikeCard.fromJson(_response.data);
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

////////////////////////////////////////////////////////////////////////////////
//////////////////////////////// Helpers Functions /////////////////////////////

//Future<Map<String, String>> _getFirebaseToken() async {
// // String token = await FirebaseMessaging().getToken();
//  return <String, String>{"DeviceToken": token};
//}

Future<String> _getUserToken() async {
  print('_getUserToken()');
  UserModel user = UserModel();
  print('UserModel');

  String userToken = await user.getToken;
  print(userToken);
  if (userToken == null) throw "User Not Logged In";
  return userToken;
}
