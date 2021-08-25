import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';


class PermissionDeniedWidget extends StatefulWidget {
  PermissionDeniedWidget({
    Key key,
  }) : super(key: key);

  @override
  _PermissionDeniedWidgetState createState() => _PermissionDeniedWidgetState();
}

class _PermissionDeniedWidgetState extends State<PermissionDeniedWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).focusColor.withOpacity(0.7),
                          Theme.of(context).focusColor.withOpacity(0.05),
                        ])),
                child: Icon(
                  Icons.https,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  size: 50,
                ),
              ),
              Positioned(
                right: -30,
                bottom: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                left: -20,
                top: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Opacity(
            opacity: 0.4,
            child: Text(
                // S.of(context).you_must_signin_to_access_to_this_section,
                  LocaleKeys.you_must_signin_to_access_to_this_section.tr(),

                textAlign: TextAlign.center,
                style: TextStyle()),
          ),
          SizedBox(height: 50),
          FlatButton(
            onPressed: () {
              // selectedIndexHome = 0;
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 70),
            color: kPrimaryColor,
            shape: StadiumBorder(),
            child: Text(
              LocaleKeys.sign_in_translate.tr(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () {
              // selectedIndexHome = 0;
              Navigator.of(context).popUntil((route) => route.isFirst);

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
              // Navigator.of(context).pushReplacementNamed('/SignUp');
            },
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            shape: StadiumBorder(),
            child: Text(
               LocaleKeys.sign_up_translate.tr(),
              // S.of(context).i_dont_have_an_account,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
