import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/models/order.dart';
import 'package:tswooq/screens/order_list/component/order_products_card.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../size_config.dart';
import 'component/order_card.dart';

class OrderProductsScreen extends StatefulWidget {
  final List <OrderProducts> product;

  const OrderProductsScreen({Key key, @required this.product}) : super(key: key);
  @override
  _OrderProductsScreenState createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: body(
          widget.product,
        )
      //   bottomNavigationBar: CheckoutCard(cart: cart),
    );
  }

  Widget body(List<OrderProducts> product) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(product[index].ordersId.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                //   demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [



                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: OrderProductsCard(product: product[index]),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
          LocaleKeys.Your_Order_translate.tr(),
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${widget.product.length} " + LocaleKeys.items_translate.tr(),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
