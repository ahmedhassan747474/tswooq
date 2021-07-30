import 'package:flutter/material.dart';
import 'package:shop_app/models/search_product.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Products product;

  const DetailsScreen({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: product.rating),
      body: Body(product: product),
    );
  }
}
