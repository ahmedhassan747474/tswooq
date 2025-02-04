import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/components/twest_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/products.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/utils/api_products.dart';

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

  int page = 1;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    print(widget.id);
    product = await ApiProducts.instance.getProductsByBrand(widget.id);
    _isLoading = false;
    if (mounted) setState(() {});
  }

  RefreshController _controller = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    page++;
    ProductsModel products = new ProductsModel(productData: []);

    products =
        await ApiProducts.instance.getProductsByCategory(widget.id, page);
    if (kIsWeb)
      product.productData.insertAll(0, products.productData);
    else
      product.productData.addAll(products.productData);

    if (mounted) setState(() {});
    _controller.refreshCompleted();
  }

  void _onPage(int page) async {
    // ProductsModel products = new ProductsModel(productData: []);
    pageIndex = page - 1;
    setState(() {});
    product = await ApiProducts.instance.getProductsByCategory(widget.id, page);
    // if (kIsWeb)
    //   product.productData.insertAll(0, products.productData);
    // else
    //   product.productData.addAll(products.productData);

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
          : SmartRefresher(
              // physics: ClampingScrollPhysics(),
              // physics: ScrollPhysics(),
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
            ),
      bottomNavigationBar: (kIsWeb || kDebugMode)
          ? Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product?.to ?? product?.lastPage ?? 30,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: helpClip(
                      8,
                      InkWell(
                        onTap: () => _onPage(index + 1),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: pageIndex == index
                                      ? Color(0xFF143444)
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(10),
                              color: pageIndex == index
                                  ? Colors.white
                                  : Color(0xFF143444),
                              // boxShadow: [
                              //   BoxShadow(color: Colors.green, spreadRadius: 3),
                              // ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                      color: pageIndex == index
                                          ? Color(0xFF143444)
                                          : Colors.white),
                                ),
                              ),
                            )),
                      )),
                ),
              ))
          : SizedBox(),
    );
  }

  Widget listView(ProductsModel product) {
    return ListView.builder(
        itemCount: product.productData.length ?? 0,
        itemBuilder: (ctx, index) => product
                .productData[index].attributes.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product.productData[index],
                              )));
                    },
                    child: TwistCard(product: product.productData[index])))
            : SizedBox());
  }

  Widget gridView(ProductsModel product) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: kIsWeb
            ? helpWidth(context) > 600
                ? 3
                : 2
            : 2,
        crossAxisSpacing: 10,
        staggeredTileBuilder: (_) =>
            StaggeredTile.extent(1, helpHeight(context) * .4),
        // //  controller: popularProvider.scrollController,/
        itemCount: product.productData.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return product.productData[index].attributes.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: product.productData[index],
                                )));
                      },
                      child: ProductCard(product: product.productData[index])))
              : SizedBox();
        });
  }
}
