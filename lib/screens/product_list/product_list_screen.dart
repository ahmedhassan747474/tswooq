import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/components/home_card.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/utils/api_products.dart';

import '../../size_config.dart';

class ProductListScreen extends StatefulWidget {
  final int id;

  const ProductListScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductListScreenState();
  }
}

class ProductListScreenState extends State<ProductListScreen> {
  ProductsModel product = new ProductsModel(data: []);
  bool isGridView=true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    product = await ApiProducts.instance.getProductsByCategory(widget.id);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(color: Colors.black),
        ),

        centerTitle: true,
        actions: [
          IconButton(
            icon: isGridView? Icon(Icons.list):Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                if(isGridView)
                  isGridView =false;
                else
                  isGridView= true;
              });

              },
            color: Colors.black,
          )
        ],
      ),
      body: isGridView ? gridView(product):listView(product),
    );
  }

  Widget listView(ProductsModel product) {
    return  Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
          itemCount: product.data.length ?? 0,
          itemBuilder:  (ctx,index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(product: product.data[index],)));
              },
                child: ProductCard(product: product.data[index]))))
        );
  }
  Widget gridView(ProductsModel product) {
    return  Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        child:StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 10,

            staggeredTileBuilder: (_) => StaggeredTile.extent(1, 230),
            // //  controller: popularProvider.scrollController,/
            itemCount: product.data.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: product.data[index],
                            )));
                      },
                      child: ProductCard(product: product.data[index])));
            }),
    );
  }

  // AppBar buildAppBar(BuildContext context) {
  //   return AppBar(
  //     title: Text(
  //       "Products",
  //       style: TextStyle(color: Colors.black),
  //     ),
  //
  //     centerTitle: true,
  //     actions: [
  //       IconButton(
  //         icon: Icon(Icons.),
  //         onPressed: () {},
  //         color: Colors.white,
  //       )
  //     ],
  //   );
  // }
}
