import 'package:flutter/material.dart';

import '../size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
    @required this.cardWidth,
    @required this.imgHeight,
    @required this.imgWidth,
  }) : super(key: key);

  final String icon, text;
  final double cardWidth, imgHeight, imgWidth;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(cardWidth),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(imgHeight),
              width: getProportionateScreenWidth(imgWidth),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                icon,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}