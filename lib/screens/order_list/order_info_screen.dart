import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/screens/order_list/component/order_info_form.dart';

import '../../constants.dart';
import '../../size_config.dart';

class OrderInfoScreen extends StatefulWidget {
  final int totalPrice;

  const OrderInfoScreen({Key key, @required this.totalPrice}) : super(key: key);


  @override
  _OrderInfoScreenState createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("delivery Information"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  Text("Make Order", style: headingStyle),
                  Text(
                    "Complete your information ",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  OrderForm(totalPrice: widget.totalPrice,),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
