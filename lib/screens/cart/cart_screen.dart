import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tswooq/components/permission_denied_widget.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/Cart.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/screens/order_list/order_info_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_cart.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/vars.dart';

import '../../constants.dart';
import '../../size_config.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartModel cart = new CartModel(productData: []);
  CartModel cartLike = new CartModel(productData: []);
  double sum = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    cart = await ApiCart.instance.getCart();
    cartLike = await ApiCart.instance.getCartLike();
    calculateTotal();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  calculateTotal() {
    sum = 0;
    if (cart.productData?.length != 0) {
      cart.productData.forEach((element) {
        if (element.attributes?.length != 0)
          sum += double.parse(element.attributes[0].price.toString()) *
              int.parse(element.productsQuantity);
      });
    }
    if (cartLike.productData?.length != 0) {
      cartLike.productData.forEach((element) {
        sum += double.parse(element.price.toString()) *
            int.parse(element.productsQuantity);
      });
    }
  }

  Future<void> _submit(int id) async {
    try {
      print('0000000000000000000000000000');
      await ApiCart.instance.removeCart(id);
    } on ApiException catch (_) {
      print('ApiException');

      ServerConstants.showDialog1(context, _.toString());
    } on DioError catch (e) {
      //<<<<< IN THIS LINE
      print(
          "e.response.statusCode    ////////////////////////////         DioError");
      if (e.response.statusCode == 400) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        //  print(e.request);
      }
    } catch (e) {
      print('catch');
      // print(e);

      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  Future<void> _submitPos() async {
    try {
      print('0000000000000000000000000000');
      await ApiCart.instance.addToPos();
      cart = new CartModel(productData: []);
      setState(() {});
    } on ApiException catch (_) {
      print('ApiException');

      ServerConstants.showDialog1(context, _.toString());
    } on DioError catch (e) {
      //<<<<< IN THIS LINE
      print(
          "e.response.statusCode    ////////////////////////////         DioError");
      if (e.response.statusCode == 400) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        //  print(e.request);
      }
    } catch (e) {
      print('catch');
      // print(e);

      ServerConstants.showDialog1(context, e.toString());
    } finally {
      if (mounted) setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: (ApiProvider.user == null
            ? PermissionDeniedWidget()
            : (_isLoading
                ? helpLoading()
                : body(cart.productData, cartLike.productData, context))),
        bottomNavigationBar: cart.productData.length == 0 &&
                cartLike.productData.length == 0
            ? SizedBox()
            : Container(
                padding: EdgeInsets.only(
                    // vertical: getProportionateScreenWidth(15),
                    // horizontal: getProportionateScreenWidth(30),
                    bottom: 8,
                    right: getProportionateScreenWidth(20),
                    left: getProportionateScreenWidth(20),
                    top: 5),
                // height: 174,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.15),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.Total_translate.tr(),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        helpCurrency("$sum", AppColors.PRIMARY_COLOR, context),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kPrimaryColor,
                          onPressed: () {
                            _submitPos();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              helpEn(context) ? "From store" : "من الكاشير",
                              style: TextStyle(
                                fontSize: kIsWeb ? 16 : 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kPrimaryColor,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderInfoScreen(
                                      totalPrice: sum,
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              LocaleKeys.Check_Out_translate.tr(),
                              style: TextStyle(
                                fontSize: kIsWeb ? 16 : 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget body(List<Products> product, List<Products> productLike,
      BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        width: double.infinity,
        child: product.length == 0 && cartLike.productData.length == 0
            ? Center(
                child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    "assets/images/shopcart.gif",
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      helpEn(context) ? "Go To Home" : "اذهب الى الرئيسية",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
            : ListView(
                children: [
                  ...List.generate(
                    productLike.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 88,
                            child: Container(
                              width: 88,
                              height: 88,
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: helpImage(
                                  productLike[index].productsImage, 15),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          _submit(
                                              productLike[index].productsId);
                                          productLike.removeAt(index);
                                          calculateTotal();
                                          _toastInfo(LocaleKeys
                                              .item_is_deleted_translate
                                              .tr());
                                          // _submit(product[index].productId);
                                          //   product.removeAt(index);
                                          //setState(() {});
                                        },
                                        child: Container(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ))),
                                  ],
                                ),
                                Text(
                                  productLike[index].productsName,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    helpCurrency("${productLike[index].price}",
                                        AppColors.PRIMARY_COLOR, context),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(" x ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Text(
                                        "${productLike[index].productsQuantity}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ...List.generate(
                    product.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Dismissible(
                          key: Key(product[index].productsId.toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            setState(() {
                              _submit(product[index].productsId);
                            });
                          },
                          background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                SvgPicture.asset("assets/icons/Trash.svg"),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 88,
                                child: Container(
                                  width: 88,
                                  height: 88,
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: helpImage(
                                      ServerConstants.DOMAIN +
                                          product[index].productsImage,
                                      15),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              _submit(
                                                  product[index].productsId);
                                              product.removeAt(index);
                                              calculateTotal();
                                              _toastInfo(LocaleKeys
                                                  .item_is_deleted_translate
                                                  .tr());
                                              // _submit(product[index].productId);
                                              //   product.removeAt(index);
                                              //setState(() {});
                                            },
                                            child: Container(
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                ))),
                                      ],
                                    ),
                                    Text(
                                      product[index].productsName,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        helpCurrency(
                                            "${product[index].attributes[0].price}",
                                            AppColors.PRIMARY_COLOR,
                                            context),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(" x ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        Text(
                                            "${product[index].productsQuantity}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            LocaleKeys.Cart_translate.tr(),
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${cart.productData.length + cartLike.productData.length}" +
                LocaleKeys.items_translate.tr(),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
}
