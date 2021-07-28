import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_products.dart';

import '../../../size_config.dart';

class PopularProduct extends StatefulWidget {
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  ProductsModel products = new ProductsModel(productData: []);

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    products = await ApiProducts.instance.getProducts();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: (LocaleKeys.Popular_Products_translate.tr()),
            press: () {},
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.productData.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: products.productData[index],
                              )));
                    },
                    child: ProductCard(product: products.productData[index]))),
          ),
        ),
      ],
    );
  }
}
