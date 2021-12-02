import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/no_account_text.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kIsWeb ? 20 : 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  LocaleKeys.welcome_translate.tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: helpWidth(context) * .05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/logo.png',
                  width: helpWidth(context) * .5,
                  height: 150,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                NoAccountText(),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: LocaleKeys.version.tr(),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: " ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: "1",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
