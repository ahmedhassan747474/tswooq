import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getScreenWidth(4),
            fontWeight: FontWeight.w800,
            color: Colors.red,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            LocaleKeys.See_More_translate.tr(),
            style: TextStyle(
                color: Color(0xFFBBBBBB),
                fontSize: helpMobile(context) ? 16 : 25),
          ),
        ),
      ],
    );
  }
}
