// import 'package:flutter/material.dart';
// import 'package:shop_app/components/product_card.dart';
// import 'package:shop_app/models/Cart.dart';
// import 'package:shop_app/models/products.dart';
// import '';
//
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class CartCard extends StatelessWidget {
//   const CartCard({
//     Key key,
//     @required this.product,
//   }) : super(key: key);
//
//   final CartProduct product;
//
//   Future<void> _submit(int id) async {
//
//     try {
//       print('0000000000000000000000000000');
//       await ApiCart.instance.removeCart(id);
//
//       Navigator.of(context).popUntil((route) => route.isFirst);
//       // Navigator.of(context).pushReplacement(
//       //     MaterialPageRoute(builder: (context) => OrderSuccessScreen()));
//
//     } on ApiException catch (_) {
//       print('ApiException');
//       Navigator.of(context).pop();
//       ServerConstants.showDialog1(context, _.toString());
//     } on DioError catch (e) {
//       //<<<<< IN THIS LINE
//       print(
//           "e.response.statusCode    ////////////////////////////         DioError");
//       if (e.response.statusCode == 400) {
//         print(e.response.statusCode);
//       } else {
//         print(e.message);
//         //  print(e.request);
//       }
//     } catch (e) {
//       print('catch');
//       print(e);
//
//       Navigator.of(context).pop();
//       ServerConstants.showDialog1(context, e.toString());
//     } finally {
//       if (mounted) setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 88,
//           child: AspectRatio(
//             aspectRatio: 0.88,
//             child: Container(
//               padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF5F6F9),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//              child: Image.network("https://tswooq.com/"+product.productDetail.productsImage),
//             ),
//           ),
//         ),
//         SizedBox(width: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container ( alignment: Alignment.topRight,child: Icon(Icons.close)),
//             Text(
//               product.productDetail.productsName,
//               style: TextStyle(color: Colors.black, fontSize: 16),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             Text.rich(
//               TextSpan(
//                text: "\$${product.productDetail.productsPrice}",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600, color: kPrimaryColor),
//                 children: [
//                   TextSpan(
//                       text: " x${product.quantity}",
//                       style: Theme.of(context).textTheme.bodyText1),
//                 ],
//               ),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
