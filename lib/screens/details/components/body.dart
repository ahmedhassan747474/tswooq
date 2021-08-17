import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/models/search_product.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_cart.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/vars.dart';

import '../../../constants.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

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
  int counter = 1;
  String price = '';
  List images;
  int id = 0;
  double borderWidth = 1.0;
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    id = widget.product.attributes[0].id;
    price = widget.product.attributes[0].price;

    if (widget.product.productsDescription.length > 50) {
      firstHalf = widget.product.productsDescription.substring(0, 50);
      secondHalf = widget.product.productsDescription
          .substring(50, widget.product.productsDescription.length);
    } else {
      firstHalf = widget.product.productsDescription;
      secondHalf = "";
    }
  }

  Future<void> _submit() async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiCart.instance.addToCart(widget.product.productsId, counter);
      //
      // Navigator.of(context).popUntil((route) => route.isFirst);
      helpShowLongToast(
        LocaleKeys.Add_To_Cart_translate.tr(),
      );
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Text(
                    widget.product.productsName,
                    // price,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color: widget.product.isLiked == "0"
                          ? Color(0xFFFFE6E6)
                          : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: widget.product.isLiked == "0"
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(64),
                  ),
                  child: secondHalf.isEmpty
                      ? Text(
                          removeAllHtmlTags(firstHalf),
                          maxLines: 3,
                        )
                      : Text(flag
                          ? (removeAllHtmlTags(firstHalf) + "...")
                          : (removeAllHtmlTags(firstHalf) +
                              removeAllHtmlTags(secondHalf))),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flag = !flag;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          flag
                              ? LocaleKeys.See_More_translate.tr()
                              : LocaleKeys.show_less_translate.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                for (var item in widget.product.attributes)
                  GestureDetector(
                    onTap: () {
                      price = item.price;
                      id = item.id;

                      setState(() {});
                    },
                    child: Container(
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: item.id == id ? 3 : .5)),
                        child: Row(
                          children: [
                            Text(item.color ?? ""),
                            item.size != null ? Text(item.size) : Container(),
                          ],
                        )),
                  ),
                SizedBox(width: 5),
                TopRoundedContainer(
                  color: Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(
                          children: [
                            helpCurrency("$price", Colors.deepOrange, context),
                            Spacer(),
                            RoundedIconBtn(
                              icon: Icons.remove,
                              press: () {
                                setState(() {
                                  if (counter > 1) counter--;
                                });
                              },
                            ),
                            SizedBox(width: 20),
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
                          child: widget.product.defaultStock == 0
                              ? Container(
                                  height: 50,
                                  color: Colors.red,
                                  width: 56,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 56,
                                    child: FlatButton(
                                      color: Colors.amber,
                                      // onPressed: press,
                                      child: Text(
                                        LocaleKeys.Not_Available.tr(),
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : DefaultButton(
                                  text: (LocaleKeys.Add_To_Cart_translate.tr()),
                                  press: () {
                                    if (widget.product.defaultStock == 0)
                                      _toastInfo(
                                          LocaleKeys.not_added_translate.tr());
                                    else if(ServerConstants.getUserToken() == null)
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) => SignInScreen()));
                                    else
                                      _submit();

                                  },
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
