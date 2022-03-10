import 'package:dio/dio.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/slider.dart';
import 'package:tswooq/utils/vars.dart';

import 'api_exception.dart';

class ApiSlider {
  ApiSlider._();

  static final ApiSlider instance = ApiSlider._();
  static SliderModel slider;

  //
  // static const Map<String, String> apiHeaders = {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json, text/plain, */*",
  //   "X-Requested-With": "XMLHttpRequest",
  //   "Access-Control_Allow_Origin": "*"
  // };

  Future<SliderModel> brands() async {
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
      slider = SliderModel.fromJson(_response.data);
      return slider;
    } else {
      // DioErrorType type;
      // No Success
      print(
          'ApiException....slider***********************************************************');

      print('...................................................');

      throw ApiException.fromApi(_response.statusCode, _response.data);
    }
  }
}
