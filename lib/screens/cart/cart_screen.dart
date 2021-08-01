import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/search_product.dart';
import 'package:shop_app/screens/order_list/order_info_screen.dart';
import 'package:shop_app/translations/locale_keys.g.dart';
import 'package:shop_app/utils/api_cart.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/vars.dart';

import '../../constants.dart';
import '../../size_config.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartModel cart = new CartModel(productData: []);
  double sum = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    cart = await ApiCart.instance.getCart();
    calculateTotal();
    if (mounted) setState(() {});
  }

  calculateTotal() {
    sum = 0;
    if (cart.productData?.length != 0) {
      cart.productData.forEach((element) {
        sum += double.parse(element.attributes[0].price.toString());
      });
    }
  }

  Future<void> _submit(int id) async {
    try {
      print('0000000000000000000000000000');
      await ApiCart.instance.removeCart(id);

      // Navigator.of(context).popUntil((route) => route.isFirst);
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => OrderSuccessScreen()));

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
        body: body(cart.productData, context),
        bottomNavigationBar: cart.productData.length == 0
            ? SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(15),
                  horizontal: getProportionateScreenWidth(30),
                ),
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
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: getProportionateScreenWidth(40),
                          width: getProportionateScreenWidth(40),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset("assets/icons/receipt.svg"),
                        ),
                        Spacer(),
                        Text(
                          LocaleKeys.Add_Voucher_translate.tr(),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: kTextColor,
                        )
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              LocaleKeys.Total_translate.tr(),
                            ),
                            helpCurrency("$sum", Colors.deepOrange, context),
                          ],
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(190),
                          child: DefaultButton(
                            text: LocaleKeys.Check_Out_translate.tr(),
                            press: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OrderInfoScreen(
                                        totalPrice: sum,
                                      )));
                            },
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

  Widget body(List<Products> product, BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        width: double.infinity,
        child: product.length == 0
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
                      "Go To Home",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
            : ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) => Padding(
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
                                  ServerConstants.DOMAIN + product[index].path,
                                  15),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      _submit(product[index].productsId);
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
                                        Colors.deepOrange,
                                        context),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(" x ${product[index].quantityOrdered}",
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
            "${cart.productData.length}" + LocaleKeys.items_translate.tr(),
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
