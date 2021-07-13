import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.productsId.toString(),
                  child: Image.network(product.productsImage),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.productsName,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.productsPrice}",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isLiked =="0"
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: product.isLiked =="0"
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
