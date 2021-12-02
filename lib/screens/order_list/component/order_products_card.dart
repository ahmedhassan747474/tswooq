import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/order.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../size_config.dart';

class OrderProductsCard extends StatelessWidget {
  const OrderProductsCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child:
                  helpImage(ServerConstants.DOMAIN + product.productsImage, 0),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.productsName,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(" x ${product.productsQuantity}",
                    style: Theme.of(context).textTheme.bodyText1),
                helpCurrency(
                    "${product.attributes.length == 0 ? product.price : product.attributes[0].price}",
                    AppColors.PRIMARY_COLOR,
                    context),
              ],
            ),
          ],
        )
      ],
    );
  }
}
