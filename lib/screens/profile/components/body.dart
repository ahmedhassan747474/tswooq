import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
          ProfileMenu(
            text: LocaleKeys.Notifications.tr(),
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: LocaleKeys.Settings.tr(),
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: LocaleKeys.Help_Center.tr(),
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: LocaleKeys.language_translate.tr(),
            icon: "assets/icons/Log out.svg",
            press: () async {
              if (context.locale ==
                  EasyLocalization.of(context).supportedLocales[0]) {
                // await context.setLocale(
                //   Locale("en"),
                // );
                await context.setLocale(
                  Locale("ar"),
                );
              } else {
                // await context.setLocale(
                //   Locale("ar"),
                // );
                await context.setLocale(
                  Locale("en"),
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
