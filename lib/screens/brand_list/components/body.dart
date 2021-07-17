// import 'package:flutter/material.dart';
// import 'package:shop_app/models/brands.dart';
// import 'package:shop_app/utils/api_brands.dart';
//
//
// import '../../../size_config.dart';
//
// class Body extends StatefulWidget {
//
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.all(getProportionateScreenWidth(20)),
//         child: GridView.builder(
//           // shrinkWrap: true,
//           gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisSpacing: 5.0,
//               crossAxisSpacing: 5.0,
//               childAspectRatio: 2 / 3
//           ),
//           itemCount: brands.data.length ?? 0,
//           itemBuilder: (ctx,index) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: BrandCard(
//               icon: brands.data[index].icon,
//               text: brands.data[index].categoriesName,
//               press: () {},
//             ),
//           ),
//         )
//     );
//   }
// }
//
//
// class BrandCard extends StatelessWidget {
//   const BrandCard({
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
//         width: getProportionateScreenWidth(80),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(15)),
//               height: getProportionateScreenWidth(75),
//               width: getProportionateScreenWidth(75),
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
//
//
// // Widget loadingShimmerWidget(double width, double height) {
// //   return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Color(0xFF656565).withOpacity(0.15),
// //                 blurRadius: 2.0,
// //                 spreadRadius: 1.0,
// //               )
// //             ]),
// //         child: Shimmer.fromColors(
// //             baseColor: Colors.black38,
// //             highlightColor: Colors.white,
// //             child: Container(
// //               color: Colors.black26,
// //               height: height,
// //               width: width,
// //             )),
// //       ));
// // }