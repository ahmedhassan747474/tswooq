import 'package:flutter/material.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'components/body.dart';

class OrderSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(LocaleKeys.Order_Success.tr(),),
      ),
      body: Body(),
    );
  }
}
