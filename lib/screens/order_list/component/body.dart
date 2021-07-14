import 'package:flutter/material.dart';
import 'package:shop_app/models/order.dart';

class Body extends StatefulWidget {
  List<OrderProducts> order;

  Body({Key key, @required this.order}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return;
  }
}
