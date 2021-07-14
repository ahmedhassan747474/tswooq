import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/screens/order_list/component/body.dart';
import 'package:shop_app/screens/order_list/component/order_card.dart';
import 'package:shop_app/utils/api_cart.dart';
import 'package:shop_app/utils/api_order.dart';

import '../../size_config.dart';



class OrderListScreen extends StatefulWidget {


  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {

  OrderModel order = new OrderModel(data: []);


  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async{
    order = await ApiOrder.instance.getOrder();
    if(mounted) setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
   //   body:  Body(order: order.data.,)
   //   bottomNavigationBar: CheckoutCard(cart: cart),
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
            "${order.data.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
