import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/size_config.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: helpWidth(context) * .5,
                height: 150,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Tswooq',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
    );
  }
}
