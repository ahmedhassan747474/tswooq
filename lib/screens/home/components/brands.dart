import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/components/home_card.dart';
import 'package:shop_app/models/brands.dart';
import 'package:shop_app/screens/brand_list/brand_list_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_brands.dart';
import 'package:easy_localization/easy_localization.dart';

class Brands extends StatefulWidget {
  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  BrandsModel brands = new BrandsModel(data: []);

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    brands = await ApiBrands.instance.brands();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: LocaleKeys.Brands_translate.tr(),
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BrandListScreen(
                        brands: brands,
                      )));
            },
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              padding: EdgeInsets.all(0.0),
              staggeredTileBuilder: (_) => StaggeredTile.extent(1, 100),
              itemCount: brands.data == null
                  ? 0
                  : (brands.data.length > 16 ? 16 : brands.data.length),
              itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CategoryCard(
                  icon: brands.data[index].icon,
                  text: brands.data[index].categoriesName,
                  // press: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductBrandScreen(id: brands.data[index].i,)));},
                  cardWidth: 100,
                  imgWidth: 80,
                  imgHeight: 80,
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
