import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kIsWeb ? helpWidth(context) * .5 : double.infinity,
      height: getProportionateScreenHeight(56),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kPrimaryColor,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: kIsWeb ? 30 : helpWidth(context) * .04,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
