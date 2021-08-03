import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/helper/loading_shimmer.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/product_list/product_list.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_products.dart';

import '../../../size_config.dart';

class PopularProduct extends StatefulWidget {
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  ProductsModel products = new ProductsModel(productData: []);
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    products = await ApiProducts.instance.getProducts();
    _isLoading = false;
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
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                        product: products,
                      )));
            },
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _isLoading ? 10 : products.productData.length ?? 0,
            itemBuilder: (ctx, index) => _isLoading
                ? Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 0, right: 5, left: 5),
                          child: loadingShimmerWidget(140, 160, 15)),
                      Container(
                          margin: EdgeInsets.only(top: 10, right: 5, left: 5),
                          child: loadingShimmerWidget(140, 45, 10)),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    product: products.productData[index],
                                  )));
                        },
                        child:
                            ProductCard(product: products.productData[index]))),
          ),
        ),
      ],
    );
  }
}
