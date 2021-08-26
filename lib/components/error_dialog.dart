import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/vars.dart';
import 'package:easy_localization/easy_localization.dart';

class ErrorPopUp extends StatelessWidget {
  final String message;

  ErrorPopUp({@required this.message});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
          LocaleKeys.sorry_translate.tr(),
        style: TextStyle(),
      ),
      content: Column(
        children: <Widget>[
          SizedBox(height: 8.0),
          Container(
            child: Text(
              "$message",
              style: TextStyle(),
            ),
          ),
          SizedBox(height: 24.0),
          RaisedButton(
            color: AppColors.PRIMARY_COLOR,
            child: Text(
              LocaleKeys.ok_translate.tr(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
