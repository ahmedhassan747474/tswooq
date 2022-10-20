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

class ProductByCategoryScreen extends StatefulWidget {
  final int id;
  final String title;

  const ProductByCategoryScreen({
    Key key,
    this.id,
    this.title,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductByCategoryScreenState();
  }
}

class ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  ProductsModel product =
      new ProductsModel(productData: [], lastPage: 30, to: 30);
  // AllCategoriesModel brand = new AllCategoriesModel(data: []);
  bool isGridView = false;
  bool _isLoading = true;
  int page = 1;
  int pageIndex = 0;
  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  didUpdateWidget(ProductByCategoryScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initData();
  }

  _initData() async {
    print("pppppppppppppp");
    // product.
    if (!_isLoading)
      setState(() {
        _isLoading = true;
      });

    // brand = await ApiCategories.instance.allBrand(widget.id);
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
    _isLoading = true;
    setState(() {});
    product = await ApiProducts.instance.getProductsByCategory(widget.id, page);
    // if (kIsWeb)
    //   product.productData.insertAll(0, products.productData);
    // else
    //   product.productData.addAll(products.productData);
    _isLoading = false;
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
    if (product.productData != null && product.productData.isNotEmpty)
      return _isLoading
          ? helpLoading()
          : Column(
              children: [
                isGridView ? gridView(product) : listView(product),
                (kIsWeb)
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
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
                    : SizedBox()
              ],
            );
    else
      return Center(
        child: Text(helpEn(context)
            ? "No Products found please choose another category"
            : "لا يوجد منتجات من فضلك اختر فئة مختلفة"),
      );
    // return Scaffold(
    //   // appBar: PreferredSize(
    //   //   child: Container(
    //   //     // height: 100,
    //   //     padding: EdgeInsets.only(
    //   //       top: MediaQuery.of(context).padding.top + 5,
    //   //     ),
    //   //     child: Column(
    //   //       children: [
    //   //         Row(
    //   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   //           crossAxisAlignment: CrossAxisAlignment.center,
    //   //           children: [
    //   //             SizedBox(
    //   //               height: 40,
    //   //               width: 40,
    //   //               child: FlatButton(
    //   //                 shape: RoundedRectangleBorder(
    //   //                   borderRadius: BorderRadius.circular(60),
    //   //                 ),
    //   //                 color: Colors.white,
    //   //                 padding: EdgeInsets.zero,
    //   //                 onPressed: () => Navigator.pop(context),
    //   //                 child: helpEn(context)
    //   //                     ? SvgPicture.asset(
    //   //                         "assets/icons/Back ICon.svg",
    //   //                         height: 15,
    //   //                       )
    //   //                     : Icon(Icons.arrow_back_ios_rounded),
    //   //               ),
    //   //             ),
    //   //             Text(
    //   //               widget.title,
    //   //               style: TextStyle(
    //   //                   color: Colors.black,
    //   //                   fontSize: 16,
    //   //                   fontWeight: FontWeight.bold),
    //   //             ),
    //   //             IconButton(
    //   //               icon: isGridView ? Icon(Icons.list) : Icon(Icons.grid_view),
    //   //               onPressed: () {
    //   //                 setState(() {
    //   //                   if (isGridView)
    //   //                     isGridView = false;
    //   //                   else
    //   //                     isGridView = true;
    //   //                 });
    //   //               },
    //   //               color: Colors.black,
    //   //             )
    //   //           ],
    //   //         ),
    //   //         if (!_isLoading)
    //   //           Container(
    //   //             height: 40,
    //   //             child: Padding(
    //   //               padding: EdgeInsets.symmetric(
    //   //                 vertical: 0,
    //   //                 // horizontal: helpWidth(context) > 600 ? 70 : 20,
    //   //               ),
    //   //               child: ListView(
    //   //                 scrollDirection: Axis.horizontal,
    //   //                 children: [
    //   //                   ...List.generate(
    //   //                     brand.data.length ?? 0,
    //   //                     (index) => Padding(
    //   //                       padding:
    //   //                           const EdgeInsets.symmetric(horizontal: 5.0),
    //   //                       child: InkWell(
    //   //                         onTap: () {
    //   //                           Navigator.of(context).push(MaterialPageRoute(
    //   //                               builder: (context) => ProductBrandScreen(
    //   //                                     id: brand.data[index].categoriesId,
    //   //                                     title:
    //   //                                         brand.data[index].categoriesName,
    //   //                                   )));
    //   //                         },
    //   //                         child: helpClip(
    //   //                             10,
    //   //                             Container(
    //   //                               color: Color(0xFF143444),
    //   //                               child: Row(
    //   //                                 mainAxisAlignment:
    //   //                                     MainAxisAlignment.center,
    //   //                                 children: [
    //   //                                   SizedBox(
    //   //                                     width: 8,
    //   //                                   ),
    //   //                                   Text(
    //   //                                     brand.data[index].categoriesName,
    //   //                                     style: TextStyle(
    //   //                                         color: Colors.white,
    //   //                                         fontWeight: FontWeight.w800),
    //   //                                   ),
    //   //                                   SizedBox(
    //   //                                     width: 8,
    //   //                                   ),
    //   //                                 ],
    //   //                               ),
    //   //                             )),
    //   //                       ),
    //   //                     ),
    //   //                   )
    //   //                 ],
    //   //               ),
    //   //             ),
    //   //           ),
    //   //       ],
    //   //     ),
    //   //   ),
    //   //   preferredSize: Size.fromHeight(100),
    //   // ),
    //   body: _isLoading
    //       ? helpLoading()
    //       : Column(
    //           children: [
    //             isGridView ? gridView(product) : listView(product),
    //             (kIsWeb || kDebugMode)
    //                 ? Container(
    //                     height: 50,
    //                     child: ListView.builder(
    //                       scrollDirection: Axis.horizontal,
    //                       itemCount: product?.to ?? product?.lastPage ?? 30,
    //                       itemBuilder: (ctx, index) => Padding(
    //                         padding: const EdgeInsets.all(4.0),
    //                         child: helpClip(
    //                             8,
    //                             InkWell(
    //                               onTap: () => _onPage(index + 1),
    //                               child: Container(
    //                                   decoration: BoxDecoration(
    //                                     border: Border.all(
    //                                         color: pageIndex == index
    //                                             ? Color(0xFF143444)
    //                                             : Colors.white),
    //                                     borderRadius: BorderRadius.circular(10),
    //                                     color: pageIndex == index
    //                                         ? Colors.white
    //                                         : Color(0xFF143444),
    //                                     // boxShadow: [
    //                                     //   BoxShadow(color: Colors.green, spreadRadius: 3),
    //                                     // ],
    //                                   ),
    //                                   child: Padding(
    //                                     padding: const EdgeInsets.symmetric(
    //                                         horizontal: 8),
    //                                     child: Center(
    //                                       child: Text(
    //                                         "${index + 1}",
    //                                         style: TextStyle(
    //                                             color: pageIndex == index
    //                                                 ? Color(0xFF143444)
    //                                                 : Colors.white),
    //                                       ),
    //                                     ),
    //                                   )),
    //                             )),
    //                       ),
    //                     ))
    //                 : SizedBox()
    //           ],
    //         ),
    //   // SmartRefresher(
    //   //         // physics: ClampingScrollPhysics(),
    //   //         // physics: ScrollPhysics(),
    //   //         enablePullUp: true,
    //   //         enablePullDown: false,
    //   //         header: WaterDropHeader(),
    //   //         controller: _controller,
    //   //         onLoading: () async {
    //   //           // await Future.delayed(Duration(milliseconds: 1000));
    //   //           _controller.loadComplete();
    //   //           _onRefresh();
    //   //           setState(() {});
    //   //         },
    //   //         child: isGridView ? gridView(product) : listView(product),
    //   //       ),
    //   // bottomNavigationBar: (kIsWeb || kDebugMode)
    //   //     ? Container(
    //   //         height: 50,
    //   //         child: ListView.builder(
    //   //           scrollDirection: Axis.horizontal,
    //   //           itemCount: product?.to ?? product?.lastPage ?? 30,
    //   //           itemBuilder: (ctx, index) => Padding(
    //   //             padding: const EdgeInsets.all(4.0),
    //   //             child: helpClip(
    //   //                 8,
    //   //                 InkWell(
    //   //                   onTap: () => _onPage(index + 1),
    //   //                   child: Container(
    //   //                       decoration: BoxDecoration(
    //   //                         border: Border.all(
    //   //                             color: pageIndex == index
    //   //                                 ? Color(0xFF143444)
    //   //                                 : Colors.white),
    //   //                         borderRadius: BorderRadius.circular(10),
    //   //                         color: pageIndex == index
    //   //                             ? Colors.white
    //   //                             : Color(0xFF143444),
    //   //                         // boxShadow: [
    //   //                         //   BoxShadow(color: Colors.green, spreadRadius: 3),
    //   //                         // ],
    //   //                       ),
    //   //                       child: Padding(
    //   //                         padding:
    //   //                             const EdgeInsets.symmetric(horizontal: 8),
    //   //                         child: Center(
    //   //                           child: Text(
    //   //                             "${index + 1}",
    //   //                             style: TextStyle(
    //   //                                 color: pageIndex == index
    //   //                                     ? Color(0xFF143444)
    //   //                                     : Colors.white),
    //   //                           ),
    //   //                         ),
    //   //                       )),
    //   //                 )),
    //   //           ),
    //   //         ))
    //   //     : SizedBox(),
    // );
  }

  Widget listView(ProductsModel product) {
    return Column(
        children: product.productData
            .map((e) => e.attributes.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: e,
                                )));
                      },
                      child: TwistCard(product: e),
                    ),
                  )
                : SizedBox())
            .toList());
    return ListView.builder(
        // scrollDirection: Axis.v,
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
