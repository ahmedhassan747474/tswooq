import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/home_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/category_like_card.dart';
import 'package:tswooq/models/producr_like_card.dart';
import 'package:tswooq/screens/home/like_card/like_cart_sub_category2.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'like_card_screen.dart';

class LikeCardCategoryScreen extends StatefulWidget {
  LikeCardCategoryScreen({this.categoriesLC});

  CategoriesData categoriesLC;

  @override
  _LikeCardCategoryScreenState createState() => _LikeCardCategoryScreenState();
}

class _LikeCardCategoryScreenState extends State<LikeCardCategoryScreen> {
  bool isGridView = true;

  ProductLikeCard productLikeCard = new ProductLikeCard(data: []);
  // bool _isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   _initData();
  // }
  //
  // _initData() async {
  //   productLikeCard = await ApiHome.instance.likeCardProduct(widget.id);
  //   _isLoading = false;
  //   if (mounted) setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoriesLC.categoryName,
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
      body: StaggeredGridView.countBuilder(
        // scrollDirection: Axis.horizontal,
        crossAxisCount: kIsWeb ? 5 : 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 0,
        padding: EdgeInsets.all(8.0),
        staggeredTileBuilder: (_) => StaggeredTile.extent(
          1,
          kIsWeb ? helpHeight(context) * .3 : helpHeight(context) * .2,
        ),
        itemCount: widget.categoriesLC.childs.length,
        itemBuilder: (ctx, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: CategoryCard(
            icon: widget.categoriesLC.childs[index].amazonImage,
            text: widget.categoriesLC.childs[index].categoryName,
            press: () {
              widget.categoriesLC.childs[index].childs.length == 0
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LikeCardProductScreen(
                            id: widget.categoriesLC.childs[index].id,
                            title:
                                widget.categoriesLC.childs[index].categoryName,
                          )))
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LikeCardCategoryScreen2(
                            categoriesLC:
                                widget.categoriesLC.childs[index].childs,
                          )));
            },
            cardWidth:
                kIsWeb ? helpHeight(context) * .1 : helpWidth(context) * .3,
            imgWidth:
                kIsWeb ? helpHeight(context) * .1 : helpWidth(context) * .25,
            imgHeight:
                kIsWeb ? helpHeight(context) * .1 : helpWidth(context) * .25,
          ),
        ),
      ),
    );
  }

  Widget listView(List<ProductLC> product) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => DetailsScreen(
                      //           product: product.productData[index],
                      //         )));
                    },
                    child: productWidget(product[index], context)))));
  }

  Widget gridView(List<ProductLC> product) {
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
                      print('${product[index].toJson()}');
                      helpLauncher(
                          "https://wa.me/+201285620239?text=${product[index].toJson()}");
                    },
                    child: productWidget(product[index], context)));
          }),
    );
  }
}

Widget productWidget(ProductLC product, BuildContext context) {
  return SizedBox(
    width: getProportionateScreenWidth(helpWidth(context)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.02,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Hero(
              tag: helpHero().toString() + product.productId.toString(),
              child: helpImage(product.productImage, 0),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 100,
          child: Column(
            children: [
              Text(
                product.productName,
                style: TextStyle(color: Colors.black),
                overflow: TextOverflow.visible,
                // maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${product.productPrice}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
