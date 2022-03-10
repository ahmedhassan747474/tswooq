import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tswooq/components/permission_denied_widget.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/search_product.dart';
import 'package:tswooq/models/user.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/screens/sign_in/sign_in_screen.dart';
import 'package:tswooq/translations/locale_keys.g.dart';
import 'package:tswooq/utils/api.dart';
import 'package:tswooq/utils/api_exception.dart';
import 'package:tswooq/utils/api_products.dart';
import 'package:tswooq/utils/vars.dart';

import '../../constants.dart';
import '../../size_config.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavoriteScreenState();
  }
}

class FavoriteScreenState extends State<FavoriteScreen> {
  SearchProduct product = new SearchProduct(productData: []);
  bool isGridView = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    product = await ApiProducts.instance.getFav();
    user = ApiProvider.user;
    if (mounted) setState(() {});
  }

  UserModel user = new UserModel();

  Future<void> _unLikeSubmit(int id) async {
    try {
      setState(() {});
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      ApiProducts.instance.unLikeProduct(id);
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

  Future<void> _likeSubmit(int id) async {
    try {
      setState(() {});
      print('0000000000000000000000000000');
      //    LoadingScreen.show(context);
      await ApiProducts.instance.likeProduct(id);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.favorite.tr(),
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
      body: ApiProvider.user == null
          ? PermissionDeniedWidget()
          : product.productData.length == 0
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(),
                    SizedBox(
                      width: 100,
                      child: Image.asset(
                        "assets/logo.png",
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryColor,
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      child: Text(
                        LocaleKeys.no_Product.tr(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ))
              : isGridView
                  ? gridView(product.productData)
                  : listView(product.productData),
    );
  }

  Widget listView(List<Products> product) {
    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(40)),
        child: ListView.builder(
            itemCount: product.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product[index],
                              )));
                    },
                    child: SizedBox(
                        width: getProportionateScreenWidth(140),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 88,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.network(
                                      product[index].productsImage),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product[index].productsName,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    maxLines: 2,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      helpCurrency(
                                          "${product[index]..attributes[0].price}",
                                          AppColors.PRIMARY_COLOR,
                                          context),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          if (product[index].productsLiked == 0)
                                            _likeSubmit(
                                                product[index].productsId);
                                          else {
                                            product[index].productsLiked = 0;
                                            product.removeAt(index);
                                            _unLikeSubmit(
                                                product[index].productsId);
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              getProportionateScreenWidth(8)),
                                          height:
                                              getProportionateScreenWidth(28),
                                          width:
                                              getProportionateScreenWidth(28),
                                          decoration: BoxDecoration(
                                            color:
                                                product[index].productsLiked ==
                                                        0
                                                    ? kPrimaryColor
                                                        .withOpacity(0.15)
                                                    : kSecondaryColor
                                                        .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/icons/Heart Icon_2.svg",
                                            color:
                                                product[index].productsLiked !=
                                                        0
                                                    ? Color(0xFFFF4848)
                                                    : Color(0xFFDBDEE4),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ))))));
  }

  Widget gridView(List<Products> product) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) => StaggeredTile.extent(1, 280),
          // //  controller: popularProvider.scrollController,/
          itemCount: product.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: product[index],
                              )));
                    }, //ProductCard(product: product[index])
                    child: Container(
                      // padding: EdgeInsets.all(6),
                      // decoration: BoxDecoration(
                      //   color: product[index].productsLiked == "0"
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
                                  tag: "${helpHero()}" +
                                      product[index].productsId.toString(),
                                  child: helpImage(
                                      product[index].productsImage ?? "", 0),
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
                                      product[index].productsName,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: kIsWeb
                                              ? 25
                                              : helpWidth(context) * .025),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      product[index]?.attributes.isEmpty
                                          ? SizedBox()
                                          : helpCurrency(
                                              "${product[index]?.attributes[0]?.price ?? 0}",
                                              AppColors.PRIMARY_COLOR,
                                              context),
                                      InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          // print(product[index].productsLiked);
                                          print(index);
                                          if (ApiProvider.user != null) {
                                            if (product[index].productsLiked ==
                                                0) {
                                              product[index].productsLiked = 1;
                                              _likeSubmit(
                                                  product[index].productsId);
                                            } else {
                                              product[index].productsLiked = 0;

                                              _unLikeSubmit(
                                                  product[index].productsId);
                                              product.remove(product[index]);
                                              setState(() {});
                                            }
                                          } else
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignInScreen()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color:
                                                product[index].productsLiked ==
                                                        0
                                                    ? kPrimaryColor
                                                        .withOpacity(0.15)
                                                    : kSecondaryColor
                                                        .withOpacity(0.1),
                                            shape: BoxShape.circle,
                                          ),
                                          child: SvgPicture.asset(
                                            "assets/icons/Heart Icon_2.svg",
                                            color:
                                                product[index].productsLiked !=
                                                        0
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
                    )));
          }),
    );
  }
}
