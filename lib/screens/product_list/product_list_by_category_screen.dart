import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/products.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/utils/api_products.dart';

class ProductByCategoryScreen extends StatefulWidget {
  final int id;
  final String title;

  const ProductByCategoryScreen({
    Key key,
    @required this.id,
    @required this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductByCategoryScreenState();
  }
}

class ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  ProductsModel product = new ProductsModel(productData: []);
  bool isGridView = true;
  bool _isLoading = true;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    // product = await ApiProducts.instance.getProductsByBrand(widget.id);
    // //
    product = await ApiProducts.instance.getProductsByCategory(widget.id, page);
    _isLoading = false;
    if (mounted) setState(() {});
  }

  RefreshController _controller = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    page++;
    ProductsModel products = new ProductsModel(productData: []);

    products =
        await ApiProducts.instance.getProductsByCategory(widget.id, page);
    product.productData.addAll(products.productData);
    if (mounted) setState(() {});
    _controller.refreshCompleted();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
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
            : SmartRefresher(
                enablePullUp: true,
                enablePullDown: false,
                header: WaterDropHeader(),
                controller: _controller,
                onLoading: () async {
                  // await Future.delayed(Duration(milliseconds: 1000));
                  _controller.loadComplete();
                  _onRefresh();
                  setState(() {});
                },
                child: isGridView ? gridView(product) : listView(product),
              ));
  }

  Widget listView(ProductsModel product) {
    return ListView.builder(
        itemCount: product.productData.length ?? 0,
        itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            product: product.productData[index],
                          )));
                },
                child: TwistCard(product: product.productData[index]))));
  }

  Widget gridView(ProductsModel product) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        staggeredTileBuilder: (_) =>
            StaggeredTile.extent(1, helpHeight(context) * .4),
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
        });
  }
}
