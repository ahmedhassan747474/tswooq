

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/utils/api_cart.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/vars.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Products product;

  const Body({Key key, @required this.product}) : super(key: key);

  Future<void> _submit() async {
    try {
      print('0000000000000000000000000000');
      //  if (_formKey.currentState.validate()) {
      //  print('111111111111111111111');
      //    _formKey.currentState.save();
      //    LoadingScreen.show(context);
      await ApiCart.instance.addToCart(product.productsId, 1);
      //
      // Navigator.of(context).popUntil((route) => route.isFirst);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => HomeScreen()));
      // }
    } on ApiException catch (_) {
      print('ApiException');
      // Navigator.of(context).pop();
      // ServerConstants.showDialog1(context, _.toString());
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
            ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: product),
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
                            press: _submit,
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
}
