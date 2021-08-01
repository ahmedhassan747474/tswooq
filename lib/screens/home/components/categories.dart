import 'package:flutter/material.dart';
import 'package:shop_app/components/home_card.dart';
import 'package:shop_app/helper/loading_shimmer.dart';
import 'package:shop_app/models/all_categories.dart';
import 'package:shop_app/screens/product_list/product_list_by_category_screen.dart';
import 'package:shop_app/utils/api_categories.dart';

import '../../../size_config.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  AllCategoriesModel categories = new AllCategoriesModel(data: []);
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    categories = await ApiCategories.instance.allCategories();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        //   child: Row(
        //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        // children: [
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _isLoading ? 10 : categories.data.length ?? 0,
          itemBuilder: (ctx, index) => _isLoading
              ? Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 0, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 75, 10)),
                    Container(
                        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 20, 10)),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CategoryCard(
                    icon: categories.data[index].icon,
                    text: categories.data[index].categoriesName,
                    cardWidth: 70,
                    imgHeight: 65,
                    imgWidth: 65,
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductByCategoryScreen(
                                id: categories.data[index].categoriesId,
                              )));
                    },
                  ),
                ),
        )
        //    ],

        // ),
        );
  }
}

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
//         width: getProportionateScreenWidth(70),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//               height: getProportionateScreenWidth(65),
//               width: getProportionateScreenWidth(65),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFECDF),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Image.network(
//                 icon,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(text, textAlign: TextAlign.center , style: TextStyle(fontSize: 12),)
//           ],
//         ),
//       ),
//     );
//   }
// }
