import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/screens/sign_up/sign_up_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.Dont_have_an_account_translate.tr(),
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: kIsWeb
                ? helpWidth(context) > 600
                    ? helpWidth(context) * .03
                    : 30
                : helpWidth(context) * .04,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            LocaleKeys.sign_up_translate.tr(),
            style: TextStyle(
                fontSize: kIsWeb
                    ? helpWidth(context) > 600
                        ? helpWidth(context) * .03
                        : 30
                    : helpWidth(context) * .04,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
