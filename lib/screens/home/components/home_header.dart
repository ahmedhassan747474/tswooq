import 'package:flutter/material.dart';
import 'package:tswooq/screens/home/components/search_field.dart';
import 'package:tswooq/screens/home/qr.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return QRViewExample();
                    },
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.PRIMARY_COLOR,
                ),
                child: Image.asset('assets/qr-code.png'),
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: Image.asset(
              "assets/logo.png",
            ),
          ),
          // IconBtnWithCounter(
          //     svgSrc: "assets/icons/Cart Icon.svg",
          //     press: () => Navigator.of(context)
          //         .push(MaterialPageRoute(builder: (context) => CartScreen()))),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Bell.svg",
          //   numOfitem: 3,
          //   press: () {},
          // ),
        ],
      ),
    );
  }
}
