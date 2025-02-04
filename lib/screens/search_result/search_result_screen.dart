import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

import '../../constants.dart';
import '../../size_config.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({
    Key key,
    @required this.products,
  }) : super(key: key);

  final SearchProduct products;

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool isGridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.Products.tr(),
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
      body: isGridView
          ? widget.products.productData.length == 0
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
              : gridView(widget.products)
          : listView(widget.products),
    );
  }

  Widget listView(SearchProduct product) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.productData.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => DetailsScreen(
                      //           product: product.productData[index],
                      //         )));
                    },
                    child: TwistCard(product: product.productData[index])))));
  }

  Widget gridView(SearchProduct product) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) => StaggeredTile.extent(1, 280),
          // //  controller: popularProvider.scrollController,/
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
