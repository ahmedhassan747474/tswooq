import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/components/home_card.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_products.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../size_config.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  ProductsModel product = new ProductsModel(productData: []);
  bool isGridView=true;
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
          LocaleKeys.Products.tr(),
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
            itemCount: product.productData.length ?? 0,
            itemBuilder:  (ctx,index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(product: product.productData[index],)));
                    },
                    child: ProductCard(product: product.productData[index]))))
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
