import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/components/error_dialog.dart';
import 'package:shop_app/models/user.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFF0081B0);
  static const Color Hinit_Text_color = Color(0x7F0081B0);
  static const Color SECONDARY_COLOR = Color(0xFF1090B0);
  static const Color Background = Color(0xFFF8F8F8);
  static const Color Button_COLOR = Color(0xFF1090B0);
  static const Color Bottom_Bar_COLOR = Color(0xFF1090B0);
  static const Color My_Text_COLOR = Color(0x7F0081B0);
}

class ImageConfig {
  static const int QUALITY = 85;
  static const double WIDTH = null;
  static const double HEIGHT = null;
}

class ServerConstants {
  static bool isValidResponse(int statusCode) {
    return statusCode >= 200 && statusCode <= 302;
  }

  static void showDialog1(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (context) => ErrorPopUp(message: '$s'),
    );
  }

  static String getUserToken() {
    print('_getUserToken()');
    UserModel user = UserModel();
    print('UserModel');

    String userToken = user.token;
    print(userToken);
    // if (userToken == null) throw "User Not Logged In";
    return userToken;
  }

  static const bool IS_DEBUG = true; // TODO: Close Debugging in Release.
  static const String DOMAIN = "https://tswooq.com/";
  static const String API = "${DOMAIN}api/v1/";
  static const String Login = "${API}sign_in";
  static const String LoginFB = "${API}sign_with_social";
  static const String Register = "${API}sign_up";
  static const String Register_ActiveSms =
      "${API}client/activate-registered-user";
  static const String Resend_Code = "${API}client/resend-confirm-code";
  static const String Reset_Password =
      "${API}client/send-reset-password-confirm-code";
  static const String Check_Reset_Password =
      "${API}client/check-reset-password-confirm-code";

  static const String Send_New_Password = "${API}client/reset-password";
  static const String Logout = "${API}auth/logout";
  static const String Change_Password = "${API}change_password";

//    User
  static const String get_profile = "${API}get_profile";
  static const String Forget_Password = "${API}forget_password";
  static const String Update_profile = "${API}update_profile";
  static const String Fcm_Token = "${API}client/set-device-id";

  //Home
  static const String Home = "${API}main";
  static const String AllCategories = "${API}get_categories";
  static const String Brands = "${API}get_brands";
  static const String Products = "${API}getallproducts";

  static const String getListOfTables =
      "${API}get_list_of_tables?restaurant_id=";
  static const String listOfRestaurantsByCategory =
      "${API}list_of_restaurants_by_category?id=";
  static const String Notifications = "${API}customer/notifications";
  static const String restaurant_qr = "${API}restaurant_qr/";
  static const String search = "${API}search";

  //BasicCategories_List
  static const String BasicCategories_List = "${API}basic-categories";

  //BasicCategories_List
  static const String PaginateStore_List = "${API}client/basic-categories/";

  //BasicCategories_List
  static const String ShowStoreCategories_List = "${API}client/stores/";
  //Paginate Products
  static const String Paginate_Products_List = "${API}client/stores/";
  //Get_Cart
  static const String Get_Cart = "${API}get_cart";
  static const String Add_Cart = "${API}add_to_cart";
  static const String remove_Cart = "${API}customer/deleteCart";
  static const String bookingTable = "${API}create_reservation";

  //Order_List
  static const String Order_List = "${API}customer/orders";
  static const String OrderMake = "${API}create_order";
  static const String Order_Cancel = "${API}client/orders/";
}
