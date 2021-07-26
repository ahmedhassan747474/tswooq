import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/translations/locale_keys.g.dart';


class LanguageScreen extends StatefulWidget {

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
   bool bluee = false;
    bool bluea = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () async{
                await context.setLocale(Locale("en"),);
                //bluee = true;
              },
              child: Container(
                // decoration: BoxDecoration(
                //   color: bluee? Colors.blue: Colors.white,
                // ),
                //color: checked? Colors.blue: Colors.white,
                height: 80,
                child: Text("English"),
              ),
            ),
            GestureDetector(
              onTap: () async{
                await context.setLocale(Locale("ar"),);
               // bluea = true;
              },
              child: Container(
                // decoration: BoxDecoration(
                //   color: bluea? Colors.blue: Colors.white,
                // ),
              //  color: checked? Colors.blue: Colors.white,
                height: 80,
                child: Text("العربية"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
