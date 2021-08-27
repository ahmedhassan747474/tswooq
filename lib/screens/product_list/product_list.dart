import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/products.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api_products.dart';

class ProductListScreen extends StatefulWidget {
  final ProductsModel product;

  const ProductListScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListScreenState();
  }
}

class ProductListScreenState extends State<ProductListScreen> {
  bool isGridView = true;
  bool _isLoading = true;
  int page = 1;
  RefreshController _controller = RefreshController();

  Future<void> _onRefresh() async {
    print("-------------------------object--------------------------------");
    page++;
    ProductsModel products2 = await ApiProducts.instance.getProducts(page);
    widget.product.productData.addAll(products2.productData);

    if (mounted) setState(() {});
    _controller.loadComplete();
  }

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
        body: SmartRefresher(
          child:
              isGridView ? gridView(widget.product) : listView(widget.product),
          controller: _controller,
          onLoading: () {
            print(
                "-------------------------object--------------------------------");
            _onRefresh();
          },
          enablePullUp: true,
          enablePullDown: false,
        ));
  }

  Widget listView(ProductsModel product) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: helpWidth(context) * .01, vertical: 6),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) => StaggeredTile.extent(1, 490),
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
