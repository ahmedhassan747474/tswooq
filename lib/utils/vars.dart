import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tswooq/components/error_dialog.dart';
import 'package:tswooq/models/user.dart';

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFF143444);
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

  //
  static Map<String, String> apiHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json, text/plain, */*",
  };
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
  static const String getUpdates = "${DOMAIN}api/getupdates";
  static const String get_profile = "${API}get_profile";
  static const String Forget_Password = "${API}forget_password";
  static const String Update_profile = "${API}update_profile";
  static const String Fcm_Token = "${API}client/set-device-id";

  //Home
  static const String Home = "${API}main";
  static const String getSliders = "${API}getsliders";
  static const String getVendors = "${API}get_vendors";
  static const String getGroup = "${API}get_all_groups";
  static const String productLikeCard = "${API}search";
  static const String get_like_card_categories =
      "${API}get_like_card_categories";
  static const String AllCategories = "${API}get_categories";
  static const String Brands = "${API}get_brands";
  static const String Products = "${API}getallproducts";
  static const String Products_By_Category = "${API}getproductsbycategory";
  static const String Products_By_Brand = "${API}getproductsbybrand";
  static const String Like_Product = "${API}likeproduct";
  static const String UnLike_Product = "${API}unlikeproduct";
  static const String Get_Fav = "${API}getfavourites";
  static const String getproductbyid = "${API}getproductbyid";

  static const String search = "${API}getfilterproducts";

  //Get_Cart
  static const String addtopos = "${API}addtopos";
  static const String Get_Cart = "${API}get_cart";
  static const String Add_Cart = "${API}add_to_cart";
  static const String remove_Cart = "${API}delete_cart";
  static const String bookingTable = "${API}create_reservation";

  //Order_List
  static const String Order_List = "${API}getorders";
  static const String OrderMake = "${API}addtoorder";
  static const String Order_Cancel = "${API}cancelorder";

  static const String PaymentMethodModel = "${API}getpaymentmethods";
}
