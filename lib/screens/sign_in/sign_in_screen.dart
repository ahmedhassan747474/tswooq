import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

import '../../constants.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.sign_in_translate.tr(),),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text("Skip", style: TextStyle(fontSize: 18, color: kPrimaryColor),),
              )),
        ],
      ),
      body: Body(),
    );
  }
}
