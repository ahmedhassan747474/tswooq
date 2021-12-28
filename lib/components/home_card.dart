import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';

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
              padding: EdgeInsets.all(6),
              height: imgHeight,
              width: imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFF143444),
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child:

                  // Html(
                  //   data: "<img src=\"$icon\">",
                  // ),

                  helpImage(
                icon,
                0,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
