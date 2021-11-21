import 'package:flutter/material.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/screens/home/components/section_title.dart';
import 'package:tswooq/screens/product_list/product_list.dart';

import '../../../size_config.dart';

class PopularProduct extends StatefulWidget {
  Group group;
  PopularProduct(this.group);
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  int page = 1;

  // ProductsModel products = new ProductsModel(productData: []);

  // Future<void> _onRefresh() async {
  //   page++;
  //   ProductsModel products2 = await ApiProducts.instance.getProducts(page);
  //   products.productData.addAll(products2.productData);
  //   products2 = null;
  //   _isLoading = false;
  //   if (mounted) setState(() {});
  //   _controller.refreshCompleted();
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   _initData();
  // }
  //
  // _initData() async {
  //   // products = await ApiProducts.instance.getProducts(1);
  //   _isLoading = false;
  //   if (mounted) setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return
        // List.generate(widget.group., (index) => null)
        Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title:
                (helpEn(context) ? widget.group.nameEn : widget.group.nameAr),
            // title: (LocaleKeys.Popular_Products_translate.tr()),
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductListScreen(
                        product: widget.group.products,
                      )));
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          // height: 270,
          height: helpMobile(context) ? 270 : helpHeight(context) * .32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.group.products.length ?? 0,
            itemBuilder: (ctx, index) =>
                // _isLoading
                //     ? Column(
                //         children: [
                //           Container(
                //               margin: EdgeInsets.only(bottom: 0, right: 5, left: 5),
                //               child: loadingShimmerWidget(140, 160, 15)),
                //           Container(
                //               margin: EdgeInsets.only(top: 10, right: 5, left: 5),
                //               child: loadingShimmerWidget(140, 45, 10)),
                //         ],
                //       )
                //     :
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    product: widget.group.products[index],
                                  )));
                        },
                        child: ProductCard(
                            product: widget.group.products[index]))),
          ),
        ),
      ],
    );
  }
}
