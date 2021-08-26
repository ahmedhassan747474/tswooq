import 'package:flutter/material.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_up_translate.tr(),),
      ),
      body: Body(),
    );
  }
}
