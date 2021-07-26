import 'package:flutter/material.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/screens/order_list/order_products.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_order.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../size_config.dart';
import 'component/order_card.dart';

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

  _initData() async {
    order = await ApiOrder.instance.getOrder();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: body(
        order.data,
      ),
    );
  }

  Widget body(List<OrderDetails> order) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderProductsScreen(
                          product: order[index].data,
                        )));
              },
              child: OrderCard(order: order[index])),
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
            "${order.data.length} "+ LocaleKeys.items_translate.tr(),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
