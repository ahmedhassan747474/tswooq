import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:tswooq/components/default_button.dart';
import 'package:tswooq/components/rounded_icon_btn.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/size_config.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_cart.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_products.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../constants.dart';
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
  UserModel user = new UserModel();
  int counter = 1;
  String price = '0';
  List images;
  int id = 0;

  double borderWidth = 1.0;
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  void initState() {
    // user = ApiProvider.user;
    super.initState();
    if (widget.product?.attributes.isNotEmpty) {
      id = widget.product.attributes[0].id;
      price = widget.product.attributes[0].price;
    }
  }

  Future<void> _unLikeSubmit() async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiProducts.instance.unLikeProduct(widget.product.productsId);
      //
      // Navigator.of(context).popUntil((route) => route.isFirst);

    } on ApiException catch (_) {
      print('ApiException');
      // Navigator.of(context).pop();
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
      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  Future<void> _likeSubmit() async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiProducts.instance.unLikeProduct(widget.product.productsId);
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

      Navigator.of(context).pop();
      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  Future<void> _submit() async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiCart.instance.addToCart({
        "product_id": widget.product.productsId,
        "stock_id": id,
        "quantity": counter,
        'type': '1'
      });
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

  int selectedImage = 0;
  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(38),
        width: getProportionateScreenWidth(38),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: helpImage(widget.product.productsImage, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.product.toJson());
    // print(widget.product.attributes[0].id);
    // print(widget.product.attributes[1].id);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: kIsWeb ? 300 : getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: helpImage(widget.product.productsImage, 0),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(widget.product.attributes.length,
                  (index) => buildSmallProductPreview(index)),
            ],
          ),
          // ProductImages(product: widget.product),
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
                  child: InkWell(
                    onTap: () {
                      // print(widget.product.productsLiked);
                      if (ApiProvider.user != null) {
                        if (widget.product.productsLiked == 0)
                          _likeSubmit();
                        else
                          _unLikeSubmit();
                      } else
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: kIsWeb ? 70 : 64,
                      decoration: BoxDecoration(
                        color: widget.product.productsLiked == 0
                            ? Color(0xFFF6F7F9)
                            : Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: widget.product.productsLiked == 0
                            ? Color(0xFFDBDEE4)
                            : Color(0xFFFF4848),
                        height: getProportionateScreenWidth(16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ReadMoreText(
                    widget.product.productsDescription,
                    trimLines: 2,
                    colorClickableText: Colors.black87,
                    style: TextStyle(color: Colors.black54),
                    trimMode: TrimMode.Line,
                    trimCollapsedText:
                        helpEn(context) ? '...Read more' : "...قراءة المزيد",
                    trimExpandedText: helpEn(context) ? ' Less' : "اقل",
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: List.generate(
                    widget.product.attributes.length,
                    (index) => GestureDetector(
                      onTap: () {
                        price = widget.product.attributes[index].price;
                        id = widget.product.attributes[index].id;
                        selectedImage = index;
                        print(widget.product.attributes[index].id);
                        setState(() {});
                      },
                      child: Container(
                          height: 50,
                          width: kIsWeb
                              ? helpWidth(context) > 600
                                  ? 300
                                  : double.infinity
                              : double.infinity,
                          margin:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: getProportionateScreenWidth(20)),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width:
                                      widget.product.attributes[index].id == id
                                          ? 3
                                          : .5)),
                          child: Row(
                            children: [
                              Text(
                                  widget.product.attributes[index].color ?? ""),
                              widget.product.attributes[index].size != null
                                  ? Text(' - ' +
                                      widget.product.attributes[index].size)
                                  : Container(),
                              widget.product.attributes[index].memory != null
                                  ? Text(' - ' +
                                      widget.product.attributes[index].memory)
                                  : Container(),
                              Spacer(),
                              helpCurrency(
                                  "${widget.product.attributes[index].price}",
                                  AppColors.PRIMARY_COLOR,
                                  context),
                            ],
                          )),
                    ),
                  ),
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
                            helpCurrency(
                                "$price", AppColors.PRIMARY_COLOR, context),
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
                            left: kIsWeb ? 70 : SizeConfig.screenWidth * 0.15,
                            right: kIsWeb ? 70 : SizeConfig.screenWidth * 0.15,
                            bottom: 20,
                            top: 15,
                          ),
                          child: widget.product.productsQuantity == '0'
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
                              : FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    if (widget.product.productsQuantity == "0")
                                      _toastInfo(
                                          LocaleKeys.not_added_translate.tr());
                                    else if (ApiProvider.user == null)
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()));
                                    else
                                      _submit();
                                  },
                                  child: Text(
                                    (LocaleKeys.Add_To_Cart_translate.tr()),
                                    style: TextStyle(
                                      fontSize: kIsWeb
                                          ? 30
                                          : helpWidth(context) * .04,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                          // DefaultButton(
                          //         text: (LocaleKeys.Add_To_Cart_translate.tr()),
                          //         press: () {
                          //           if (widget.product.productsQuantity == "0")
                          //             _toastInfo(
                          //                 LocaleKeys.not_added_translate.tr());
                          //           else if (ApiProvider.user == null)
                          //             Navigator.of(context).push(
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         SignInScreen()));
                          //           else
                          //             _submit();
                          //         },
                          //       ),
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
