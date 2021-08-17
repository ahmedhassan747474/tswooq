import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

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
            icon: "assets/icons/User Icon.svg",
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
            icon: "assets/icons/Question mark.svg",
            press: () {
              helpLauncher("https://wa.me/+201285620239");
            },
          ),
          ProfileMenu(
            text: LocaleKeys.language_translate.tr(),
            icon: "assets/icons/Log out.svg",
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
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
