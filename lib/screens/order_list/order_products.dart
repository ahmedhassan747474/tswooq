import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/screens/order_list/component/order_products_card.dart';
import 'package:shop_app/utils/api_order.dart';

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
            "Your Order",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${widget.product.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
