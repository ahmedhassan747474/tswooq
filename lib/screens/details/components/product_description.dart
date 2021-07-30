import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/search_product.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Products product;
  final GestureTapCallback pressOnSeeMore;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductDescriptionState();
  }
}

class ProductDescriptionState extends State<ProductDescription> {
  String price;
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

    if (widget.product.productsDescription.length > 50) {
      firstHalf = widget.product.productsDescription.substring(0, 50);
      secondHalf = widget.product.productsDescription
          .substring(50, widget.product.productsDescription.length);
    } else {
      firstHalf = widget.product.productsDescription;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.productsName,
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
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
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
            },
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  border: Border(),
                ),
                child: Row(
                  children: [
                    Text(widget.product.attributes.length.toString()),
                    item.size != null ? Text(item.size) : Container(),
                  ],
                )),
          ),
        SizedBox(width: 5),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: widget.product.defaultStock == 0
              ? Center(
                  child: Text(
                  LocaleKeys.Not_Available.tr(),
                  style: TextStyle(color: Colors.red),
                ))
              : Container(),
        )
      ],
    );
  }
}
