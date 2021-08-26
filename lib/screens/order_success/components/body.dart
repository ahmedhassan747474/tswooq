import 'package:flutter/material.dart';
import 'package:tswooq/components/default_button.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/size_config.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          LocaleKeys.Order_Success.tr(),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text:  LocaleKeys.Back_to_home.tr(),
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
