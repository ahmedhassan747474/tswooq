import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/permission_denied_widget.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_products.dart';

import '../../constants.dart';
import '../../size_config.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  SearchProduct product = new SearchProduct(productData: []);
  bool isGridView = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    product = await ApiProducts.instance.getFav();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.favorite.tr(),
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
      body: ApiProvider.user == null
          ? PermissionDeniedWidget()
          : product.productData.length == 0
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(),
                    SizedBox(
                      width: 100,
                      child: Image.asset(
                        "assets/logo.png",
                      ),
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
                ))
              : isGridView
                  ? gridView(product.productData)
                  : listView(product.productData),
    );
  }

  Widget listView(List<Products> product) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product[index],
                              )));
                    },
                    child: TwistCard(product: product[index])))));
  }

  Widget gridView(List<Products> product) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) => StaggeredTile.extent(1, 280),
          // //  controller: popularProvider.scrollController,/
          itemCount: product.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product[index],
                              )));
                    },
                    child: ProductCard(product: product[index])));
          }),
    );
  }
}
