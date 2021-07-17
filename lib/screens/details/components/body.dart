import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/api_cart.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/vars.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Products product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BodyState();
  }
}

class BodyState extends State<Body> {
  int counter = 0;

  Future<void> _submit() async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiCart.instance.addToCart(widget.product.productsId, counter);
      //
      // Navigator.of(context).popUntil((route) => route.isFirst);

    } on ApiException catch (_) {
      print('ApiException');
      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, _.toString());
    } on DioError catch (e) {
      //<<<<< IN THIS LINE
      print(
          "e.response.statusCode    ////////////////////////////         DioError");
      if (e.response.statusCode == 400) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        // print(e.request);
      }
    } catch (e) {
      print('catch');
      print(e);

      // Navigator.of(context).pop();
      // ServerConstants.showDialog1(context, e.toString());
      // } finally {
      //   if (mounted) setState(() {});
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(
                          children: [
                            // ...List.generate(
                            // //  product.colors.length,
                            //   (index) => ColorDot(
                            //     color: product.colors[index],
                            //     isSelected: index == selectedColor,
                            //   ),
                            // ),
                            Spacer(),
                            RoundedIconBtn(
                              icon: Icons.remove,
                              press: () {
                                setState(() {
                                  if (counter > 0) counter--;
                                });
                              },
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Text(
                              counter.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            RoundedIconBtn(
                              icon: Icons.add,
                              showShadow: true,
                              press: () {
                                setState(() {
                                  counter++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Add To Cart",
                            press:(){
                              if(widget.product.defaultStock==0)
                                _toastInfo("can't add it to cart");
                              else
                              _submit();},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
}
