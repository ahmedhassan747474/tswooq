import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/vars.dart';

import '../constants.dart';

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
    return ProductCardState();
  }
}

class ProductCardState extends State<ProductCard> {
  UserModel user = new UserModel();

  @override
  void initState() {
    user = ApiProvider.user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(6),
      // decoration: BoxDecoration(
      //   color: widget.product.productsLiked == "0"
      //       ? kPrimaryColor.withOpacity(0.15)
      //       : kSecondaryColor.withOpacity(0.1),
      //   shape: BoxShape.rectangle,
      // ),
      width: kIsWeb ? 400 : helpWidth(context) * .3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: "${helpHero()}" + widget.product.productsId.toString(),
                  child: helpImage(widget.product.productsImage ?? "", 0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      widget.product.productsName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kIsWeb ? 25 : helpWidth(context) * .025),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      widget.product?.attributes.isEmpty
                          ? SizedBox()
                          : helpCurrency(
                              "${widget.product?.attributes[0]?.price ?? 0}",
                              AppColors.PRIMARY_COLOR,
                              context),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          print(widget.product.productsLiked);
                          // if (ApiProvider.user != null) {
                          //   if (widget.product.productsLiked == "0")
                          //     _likeSubmit();
                          //   else
                          //     _unLikeSubmit();
                          // } else
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => SignInScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: widget.product.productsLiked == 0
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Heart Icon_2.svg",
                            color: widget.product.productsLiked != 0
                                ? Color(0xFFFF4848)
                                : Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
