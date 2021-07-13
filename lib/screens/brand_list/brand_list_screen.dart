import 'package:flutter/material.dart';
import 'package:shop_app/models/Cart.dart';

import 'components/body.dart';


class BrandListScreen extends StatelessWidget {
  static String routeName = "/brands";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Brands",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
