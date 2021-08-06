import 'package:flutter/material.dart';
import 'package:shop_app/helper/slider.dart';
import 'package:shop_app/screens/home/components/brands.dart';

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
            Container(height: 170, child: Categories()),
            // SpecialOffers(),/**/
            // SizedBox(height: getProportionateScreenWidth(30)),
            Container(height: 320, child: Brands()),
            Container(height: 350, child: LikeCardScreen()),
            SizedBox(height: getProportionateScreenWidth(30)),
            Container(height: 330, child: PopularProduct()),
            SizedBox(height: getProportionateScreenWidth(80)),
          ],
        ),
      ),
    );
  }
}
