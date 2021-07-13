import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_app/models/brands.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/utils/api_brands.dart';


import '../../../size_config.dart';

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

  _initData() async{
    brands = await ApiBrands.instance.brands();
    if(mounted) setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Brands",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              padding: EdgeInsets.all(0.0),
              staggeredTileBuilder: (_) => StaggeredTile.extent(1, 100),
              itemCount:  brands.data == null ? 0 : (brands.data.length > 16 ? 16 : brands.data.length),
                itemBuilder: (ctx,index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CategoryCard(
                    icon: brands.data[index].icon,
                    text: brands.data[index].categoriesName,
                    press: () { },
                  ),
                ),
            ),
          ),
        ),
      ],
    );
  }
}


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(100),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(80),
              width: getProportionateScreenWidth(80),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Image.network(
                    icon,
                    fit: BoxFit.cover,
                  ),
                 // SizedBox(height: 5),
              //    Text(text, textAlign: TextAlign.center , style: TextStyle(fontSize: 12),)
                ],
              ),
            ),
          //  SizedBox(height: 5),
          //  Text(text, textAlign: TextAlign.center , style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}


// Widget categoryGridView(
//     BuildContext context, CategoriesModel categoriesModel, bool loading) {
//   return new StaggeredGridView.countBuilder(
//     // shrinkWrap: true,
//     // primary: false,
//     scrollDirection: Axis.horizontal,
//     crossAxisCount: 2,
//     itemCount:  brands.data == null ? 0 : (brands.data.length > 16 ? 16 : brands.data.length),
//     itemBuilder: (BuildContext context, int index) => Card(
//       child: loading
//           ? loadingShimmerWidget(45, 100)
//           : InkWell(
//         onTap: () {
//           // Navigator.of(context).push(MaterialPageRoute(
//           //   builder: (context) =>
//           //       ProductCategoryScreen(categoriesModel.data[index].id),
//           // ));
//           // Navigator.of(context).push(PageRouteBuilder(
//           //     pageBuilder: (, _, _) => new ProductCategoryScreen(
//           // categoriesModel.data[index].id,
//           //     categoriesModel.data[index].name),
//           //     transitionDuration: Duration(milliseconds: 750),
//           //     transitionsBuilder:
//           //     (, Animation<double> animation, _, Widget child) {
//           //     return Opacity(
//           //     opacity: animation.value,
//           //     child: child,
//           //     );
//           //     }));
//         },
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 80,
//               width: 80,
//               child: imageWidget(
//                   "${categoriesModel.data[index].media[0].url}",
//                   BoxFit.fill),
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Text(
//                 "${categoriesModel.data[index].name}",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontFamily: "Sans",
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 3,
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     mainAxisSpacing: 1,
//     crossAxisSpacing: 1,
//     padding: EdgeInsets.all(0.0),
//     staggeredTileBuilder: (_) => StaggeredTile.extent(1, 150),
//   );
//}