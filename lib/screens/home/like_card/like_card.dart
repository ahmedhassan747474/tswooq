import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/home_card.dart';
import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/category_like_card.dart';
import 'package:tswooq/utils/api_home.dart';

import '../../../size_config.dart';
import 'like_card_screen.dart';
import 'like_cart_sub_category.dart';

class LikeCardScreen extends StatefulWidget {
  // String s;
  // LikeCardScreen(this.s);
  @override
  _LikeCardScreenState createState() => _LikeCardScreenState();
}

class _LikeCardScreenState extends State<LikeCardScreen> {
  CategoriesLikeCard categoriesLC =
      new CategoriesLikeCard(categories: CategoriesLike(data: []));
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    categoriesLC = await ApiHome.instance.likeCardCategory();
    categoriesLC.categories.data.removeAt(0);
    categoriesLC.categories.data.removeAt(0);

    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          helpEn(context) ? "shipping cards" : "كروت شحن",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: StaggeredGridView.countBuilder(
            scrollDirection: Axis.vertical,
            crossAxisCount: kIsWeb ? 5 : 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            padding: EdgeInsets.all(0.0),
            staggeredTileBuilder: (_) => StaggeredTile.extent(
                  1,
                  kIsWeb
                      ? helpHeight(context) * .2
                      : helpMobile(context)
                          ? helpWidth(context) * .4
                          : helpWidth(context) * .4,
                ),
            itemCount: _isLoading
                ? 20
                : categoriesLC.categories == null
                    ? 0
                    : categoriesLC.categories.data?.length ?? 0,
            itemBuilder: (ctx, index) {
              if (_isLoading)
                return Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 0, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 75, 10)),
                    Container(
                        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 20, 10)),
                  ],
                );
              else
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: _CategoryLikeCard(
                    icon: categoriesLC.categories.data[index].amazonImage,
                    text: categoriesLC.categories.data[index].categoryName,
                    press: () {
                      print("lenght");
                      print(categoriesLC.categories.data[index].childs.length);
                      categoriesLC.categories.data[index].childs.length == 0
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LikeCardProductScreen(
                                    id: categoriesLC.categories.data[index].id,
                                    title:
                                        categoriesLC.categories.data[index].id,
                                  )))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LikeCardCategoryScreen(
                                    categoriesLC:
                                        categoriesLC.categories.data[index],
                                  )));
                    },
                    cardWidth: kIsWeb
                        ? helpHeight(context) * .1
                        : helpMobile(context)
                            ? helpWidth(context) * .3
                            : helpWidth(context) * .3,
                    imgWidth: kIsWeb
                        ? helpHeight(context) * .1
                        : helpMobile(context)
                            ? helpWidth(context) * .18
                            : helpWidth(context) * .15,
                    imgHeight: kIsWeb
                        ? helpHeight(context) * .1
                        : helpMobile(context)
                            ? helpWidth(context) * .18
                            : helpWidth(context) * .15,
                  ),
                );
            }),
      ),
    );
  }
}

class _CategoryLikeCard extends StatelessWidget {
  const _CategoryLikeCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
    @required this.cardWidth,
    @required this.imgHeight,
    @required this.imgWidth,
  }) : super(key: key);

  final String icon, text;
  final double cardWidth, imgHeight, imgWidth;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(cardWidth),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              height: imgHeight,
              width: imgWidth,
              decoration: BoxDecoration(
                color: Color(0xFF143444),
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child:

                  // Html(
                  //   data: "<img src=\"$icon\">",
                  // ),

                  CachedNetworkImage(
                imageUrl: icon,
                // imageUrl: "$image",
                fit: BoxFit.contain,
                imageBuilder: (ctx, image) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
                placeholder: (_, __) => LoadingWidget(),
                errorWidget: (context, url, error) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black.withOpacity(.9),
                    ),
                    child: Center(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

//
// class _CategoryLikeCard extends StatelessWidget {
//   const _CategoryLikeCard({
//     Key key,
//     @required this.icon,
//     @required this.text,
//     @required this.press,
//   }) : super(key: key);
//
//   final String icon, text;
//   final GestureTapCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: SizedBox(
//         width: getProportionateScreenWidth(100),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//               height: getProportionateScreenWidth(80),
//               width: getProportionateScreenWidth(80),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFECDF),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 children: [
//                   Image.network(
//                     icon,
//                     fit: BoxFit.cover,
//                   ),
//                  // SizedBox(height: 5),
//               //    Text(text, textAlign: TextAlign.center , style: TextStyle(fontSize: 12),)
//                 ],
//               ),
//             ),
//           //  SizedBox(height: 5),
//           //  Text(text, textAlign: TextAlign.center , style: TextStyle(fontSize: 12),)
//           ],
//         ),
//       ),
//     );
//   }
// }
