import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/products.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api_products.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ProductBrandScreen extends StatefulWidget {
  final int id;
  final String title;

  const ProductBrandScreen({
    @required this.id,
    @required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductBrandScreenState();
  }
}

class ProductBrandScreenState extends State<ProductBrandScreen> {
  ProductsModel product = new ProductsModel(productData: []);
  bool isGridView = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    product = await ApiProducts.instance.getProductsByBrand(widget.id);
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          // LocaleKeys.Products.tr(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: isGridView ? Icon(Icons.list) : Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                if (isGridView)
                  isGridView = false;
                else
                  isGridView = true;
              });
            },
            color: Colors.black,
          )
        ],
      ),
      body: _isLoading
          ? helpLoading()
          : product.productData.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: helpWidth(context) * .5,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: kPrimaryColor,
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.no_Product.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : isGridView
                  ? gridView(product)
                  : listView(product),
    );
  }

  Widget listView(ProductsModel product) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.productData.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product.productData[index],
                              )));
                    },
                    child: TwistCard(product: product.productData[index])))));
  }

  Widget gridView(ProductsModel product) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) =>
              StaggeredTile.extent(1,helpMobile(context)? helpHeight(context) * .4:helpHeight(context) * .5),
          itemCount: product.productData.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product.productData[index],
                              )));
                    },
                    child: ProductCard(product: product.productData[index])));
          }),
    );
  }
}
