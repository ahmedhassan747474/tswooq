import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/screens/order_list/order_list_screen.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';

import '../../../constants.dart';
import '../edit_profile_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: LocaleKeys.MyAccount.tr(),
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: kPrimaryColor,
              width: 22,
            ),
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
          ),
          // ProfileMenu(
          //   text: LocaleKeys.Notifications.tr(),
          //   icon: "assets/icons/Bell.svg",
          //   press: () {},
          // ),
          // ProfileMenu(
          //   text: LocaleKeys.Settings.tr(),
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: LocaleKeys.Help_Center.tr(),
            icon: SvgPicture.asset(
              "assets/icons/Question mark.svg",
              color: kPrimaryColor,
              width: 22,
            ),
            press: () {
              helpLauncher("https://wa.me/+201285620239");
            },
          ),
          ProfileMenu(
              text: LocaleKeys.my_order.tr(),
              icon: Icon(Icons.language),
              press: () async {
                helpNavigateTo(context, OrderListScreen());
              }),
          ProfileMenu(
            text: LocaleKeys.language_translate.tr(),
            icon: Icon(Icons.language),
            press: () async {
              // print(context
              //     .supportedLocales); // output: [en_US, ar_DZ, de_DE, ru_RU]
              // print("${context.deviceLocale.toString()}");
              // print(context.fallbackLocale);
              // print(context.locale.toString());
              if (context.locale.toString() == 'ar') {
                await context.setLocale(
                  Locale("en"),
                );
              } else {
                await context.setLocale(
                  Locale("ar"),
                );
              }
            },
          ),
          ProfileMenu(
            text: LocaleKeys.Log_Out.tr(),
            icon: SvgPicture.asset(
              "assets/icons/Log out.svg",
              color: kPrimaryColor,
              width: 22,
            ),
            press: () {
              UserModel().removeToken();
              ApiProvider.user = UserModel();
              selectedIndexHome = 0;
              // Provider.of<AuthService>(context, listen: false).userModel = null;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignInScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
