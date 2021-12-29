import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/producr_like_card.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_cart.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_home.dart';
import 'package:tswooq/utils/vars.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class LikeCardProductScreen extends StatefulWidget {
  LikeCardProductScreen({this.id, this.title});

  String id;
  String title;

  @override
  _LikeCardProductScreenState createState() => _LikeCardProductScreenState();
}

class _LikeCardProductScreenState extends State<LikeCardProductScreen> {
  bool isGridView = true;

  ProductLikeCard productLikeCard = new ProductLikeCard(data: []);
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    productLikeCard = await ApiHome.instance.likeCardProduct(widget.id);
    _isLoading = false;
    if (mounted) setState(() {});
  }

  Future<void> _submit(ProductLC productLC) async {
    try {
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiCart.instance.addToCart({
        'product_id': productLC.productId,
        'quantity': '1',
        'product_name': productLC.productName,
        'product_image': productLC.productImage,
        'price': productLC.productPrice,
        'type': '2'
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
      helpShowLongToast(helpEn(context) ? "Must Login" : "يجب تسجيل الدخول");
      // Navigator.of(context).pop();
      // ServerConstants.showDialog1(context, e.toString());
      // } finally {
      //   if (mounted) setState(() {});
      // }
    }
  }

  Widget productWidget(ProductLC product, BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(helpWidth(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.01,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: helpHero().toString() + product.productId.toString(),
                child: helpImage(product.productImage, 0),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            // height: 120,
            child: Column(
              children: [
                Text(
                  product.productName,
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.visible,
                  // maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.productPrice}",
                      style: TextStyle(
                        fontSize: kIsWeb ? 16 : getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (ApiProvider.user == null)
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                          else
                            _submit(product);
                        },
                        icon: Icon(Icons.shopping_cart))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: isGridView ? Icon(Icons.list) : Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                if (isGridView)
                  isGridView = false;
                else
                  isGridView = true;
              });
            },
            color: Colors.black,
          )
        ],
      ),
      body: _isLoading
          ? helpLoading()
          : productLikeCard.data.length == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                          padding: EdgeInsets.all(8),
                          height: helpHeight(context) * .3,
                          width: helpWidth(context) * .5,
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(1),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/logo-likeCard.png')),
                    ),
                    Text(
                      LocaleKeys.no_Product.tr(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      overflow: TextOverflow.visible,
                      // maxLines: 2,
                    ),
                  ],
                )
              : isGridView
                  ? gridView(productLikeCard.data)
                  : listView(productLikeCard.data),
    );
  }

  Widget listView(List<ProductLC> product) {
    return Padding(
        padding: EdgeInsets.all(kIsWeb ? 8 : getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: kIsWeb
                      ? helpHeight(context) * .3
                      : helpHeight(context) * .45,
                  child: productWidget(product[index], context),
                ))));
  }

  Widget gridView(List<ProductLC> product) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: kIsWeb ? 5 : 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) => StaggeredTile.extent(
                1,
                kIsWeb ? helpHeight(context) * 1 : helpHeight(context) * .45,
              ),
          // //  controller: popularProvider.scrollController,/
          itemCount: product.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {},
                    child: productWidget(product[index], context)));
          }),
    );
  }
}
