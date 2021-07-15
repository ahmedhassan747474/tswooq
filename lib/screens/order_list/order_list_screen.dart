import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/screens/order_list/order_products.dart';
import 'package:shop_app/utils/api_order.dart';

import '../../enums.dart';
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
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.orders),
        );
  }

  Widget body(List<OrderDetails> order) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: order.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(order[index].ordersId.toString()),
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
            child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => OrderProductsScreen(product: order[index].data,)));
                },
                child: OrderCard(order: order[index])),
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
            "${order.data.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
