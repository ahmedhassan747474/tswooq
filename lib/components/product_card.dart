import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/helper/help.dart';
import 'package:shop_app/models/products.dart';
import 'package:shop_app/utils/api_exception.dart';
import 'package:shop_app/utils/api_products.dart';
import 'package:shop_app/utils/vars.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products product;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductCardState();  }
}
class ProductCardState extends State<ProductCard>{

  Future<void> _unLikeSubmit() async {
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


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(widget.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: widget.product.productsId.toString(),
                child: helpImage(widget.product.productsImage, 0),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.product.productsName,
            style: TextStyle(color: Colors.black),
            overflow: TextOverflow.visible,
            // maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.product.productsPrice}",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  height: getProportionateScreenWidth(28),
                  width: getProportionateScreenWidth(28),
                  decoration: BoxDecoration(
                    color: widget.product.isLiked == "0"
                        ? kPrimaryColor.withOpacity(0.15)
                        : kSecondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: (){
                     if(widget.product.isLiked == "0")
                       _likeSubmit();
                         else
                           _unLikeSubmit();
                    },
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: widget.product.isLiked != "0"
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


}
