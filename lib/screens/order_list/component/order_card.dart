import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/order.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final OrderDetails order;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: helpImage(
                    "https://images.unsplash.com/photo-1581067721837-e4809b29692d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8c2hvcHBpbmclMjBjYXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                    15),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    order.ordersId.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  Text(
                    LocaleKeys.Order_Number.tr(),
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  // Text(" x ${product.productsQuantity}",
                  //     style: Theme.of(context).textTheme.bodyText1),
                  helpCurrency(
                      "${order.orderPrice}", Colors.deepOrange, context),
                ],
              ),
              // Text.rich(
              //   TextSpan(
              //     text: "\$${order.orderPrice}",
              //     style: TextStyle(
              //         fontWeight: FontWeight.w600, color: kPrimaryColor),
              //     children: [
              //       TextSpan(
              //           text: " x${order.totalTax}",
              //           style: Theme.of(context).textTheme.bodyText1),
              //     ],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
