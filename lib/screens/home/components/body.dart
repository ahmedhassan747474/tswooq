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
            SizedBox(height: getProportionateScreenWidth(10)),
            ImageSlider(),
            Container(height: 250, child: Categories()),
            Container(height: 420, child: Brands()),
            Container(
                height: helpHeight(context) * .40, child: LikeCardScreen()),
            SizedBox(height: getProportionateScreenWidth(30)),
            Container(height: 480, child: PopularProduct()),
            SizedBox(height: getProportionateScreenWidth(80)),
          ],
        ),
      ),
    );
  }
}
