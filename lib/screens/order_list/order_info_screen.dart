import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/order_list/component/order_info_form.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

import '../../constants.dart';
import '../../size_config.dart';

class OrderInfoScreen extends StatefulWidget {
  final double totalPrice;

  const OrderInfoScreen({Key key, @required this.totalPrice}) : super(key: key);

  @override
  _OrderInfoScreenState createState() => _OrderInfoScreenState();
}

class _OrderInfoScreenState extends State<OrderInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Delivery_Information.tr()),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                    Text(LocaleKeys.Make_Order.tr(), style: headingStyle),
                    Text(
                      LocaleKeys.Complete_your_information.tr(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    OrderForm(
                      totalPrice: widget.totalPrice,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
