import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/permission_denied_widget.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api.dart';

import 'components/body.dart';

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
      body: ApiProvider.user == null ? PermissionDeniedWidget() : Body(),
    );
  }
}
