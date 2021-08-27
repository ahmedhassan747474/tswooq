import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/slider.dart';
import 'package:tswooq/screens/home/components/brands.dart';

import '../../../size_config.dart';
import '../like_card/like_card.dart';
import 'categories.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(10)),
            ImageSlider(),
            SizedBox(height: helpWidth(context) * .05),
            Container(
                height: helpMobile(context)
                    ? helpWidth(context) * .5
                    : helpWidth(context) * .35,
                child: Categories()),
            Container(
                height: helpMobile(context)
                    ? helpHeight(context) * .40
                    : helpHeight(context) * .40,
                child: Brands()),
            Container(
                height: helpMobile(context)
                    ? helpHeight(context) * .40
                    : helpHeight(context) * .40,
                child: LikeCardScreen()),
            SizedBox(height: getProportionateScreenWidth(30)),
            Container(height: helpWidth(context) * .8, child: PopularProduct()),
            SizedBox(
              height: helpWidth(context) * .1,
            ),
          ],
        ),
      ),
    );
  }
}
