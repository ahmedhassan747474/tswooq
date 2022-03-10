import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/components/permission_denied_widget.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/screens/order_list/order_list_screen.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';

import '../../constants.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Profile.tr(),
        ),
      ),
      body: ApiProvider.user == null
          ? PermissionDeniedWidget()
          : Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfilePic(),
                    SizedBox(height: 20),
                    SizedBox(
                      width: kIsWeb ? 500 : double.infinity,
                      child: Column(
                        children: [
                          ProfileMenu(
                            text: LocaleKeys.MyAccount.tr(),
                            icon: SvgPicture.asset(
                              "assets/icons/User Icon.svg",
                              color: kPrimaryColor,
                              width: 22,
                            ),
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditProfilePage()));
                            },
                          ),
                          ProfileMenu(
                            text: LocaleKeys.Help_Center.tr(),
                            icon: SvgPicture.asset(
                              "assets/icons/Question mark.svg",
                              color: kPrimaryColor,
                              width: 22,
                            ),
                            press: () {
                              helpLauncher("https://wa.me/+9960536990111");
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
                              if (context.locale.toString() == 'ar') {
                                await context.setLocale(
                                  Locale("en"),
                                );
                                helpLanguage = "en";
                              } else {
                                await context.setLocale(
                                  Locale("ar"),
                                );
                                helpLanguage = "ar";
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
