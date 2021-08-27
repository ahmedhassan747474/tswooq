import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/components/home_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/category_like_card.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
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
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.Brands_translate.tr(),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                ),
              ),
              SizedBox()
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: helpMobile(context)
              ? helpHeight(context) * .3
              : helpHeight(context) * .3,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 20,
              padding: EdgeInsets.all(0.0),
              staggeredTileBuilder: (_) => StaggeredTile.extent(
                1,
                helpMobile(context)
                    ? helpWidth(context) * .22
                    : helpWidth(context) * .22,
              ),
              itemCount: _isLoading
                  ? 20
                  : categoriesLC.categories == null
                      ? 0
                      : categoriesLC.categories.data.length,
              itemBuilder: (ctx, index) => _isLoading
                  ? Column(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(bottom: 0, right: 5, left: 5),
                            child: loadingShimmerWidget(75, 75, 10)),
                        Container(
                            margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                            child: loadingShimmerWidget(75, 20, 10)),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CategoryCard(
                        icon: categoriesLC.categories.data[index].amazonImage,
                        text: categoriesLC.categories.data[index].categoryName,
                        press: () {
                          print("lenght");
                          print(categoriesLC
                              .categories.data[index].childs.length);
                          categoriesLC.categories.data[index].childs.length == 0
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LikeCardProductScreen(
                                        id: categoriesLC
                                            .categories.data[index].id,
                                        title: categoriesLC
                                            .categories.data[index].id,
                                      )))
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LikeCardCategoryScreen(
                                        categoriesLC:
                                            categoriesLC.categories.data[index],
                                      )));
                        },
                        cardWidth: helpMobile(context)
                            ? helpWidth(context) * .3
                            : helpWidth(context) * .3,
                        imgWidth: helpMobile(context)
                            ? helpWidth(context) * .18
                            : helpWidth(context) * .15,
                        imgHeight: helpMobile(context)
                            ? helpWidth(context) * .18
                            : helpWidth(context) * .15,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

//
// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
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
