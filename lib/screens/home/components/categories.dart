import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/utils/api_categories.dart';

import '../../product_list/product_list_by_category_screen.dart';

class Categories extends StatefulWidget {
  final int vendorId;
  Categories(this.vendorId);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  AllCategoriesModel categories = new AllCategoriesModel(data: []);
  bool _isLoading = true;
  String title;
  int id;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    print("^^^^^^^^^^^^^^$id");

    categories =
        await ApiCategories.instance.getCategoryByVendor(widget.vendorId);
    if (categories.data != null && categories.data.isNotEmpty) {
      id = categories.data.first.categoriesId;
      title = categories.data.first.categoriesName;
    }
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox()
        : (categories.data == null && categories.data.isEmpty)
            ? Text(helpEn(context)
                ? "No Categories for this Store"
                : "لا يوجد فئات لهذا المتجر")
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: helpWidth(context) > 600 ? 70 : 20,
                      ),
                      child: Row(
                        children: [
                          // Container(
                          //   width: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     print(context.locale.toString() == 'en');
                          //     //
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => LikeCardScreen()));
                          //   },
                          //   child: helpClip(
                          //       10,
                          //       Container(
                          //         color: Color(0xFF143444),
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             SizedBox(
                          //               width: 8,
                          //             ),
                          //             Text(
                          //               helpEn(context)
                          //                   ? "shipping cards"
                          //                   : "كروت شحن",
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.w800),
                          //             ),
                          //             SizedBox(
                          //               width: 8,
                          //             ),
                          //           ],
                          //         ),
                          //       )),
                          // ),
                          // Container(
                          //   width: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     //
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) => BecomeMerchant()));
                          //   },
                          //   child: helpClip(
                          //       10,
                          //       Container(
                          //         color: Color(0xFF143444),
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             SizedBox(
                          //               width: 8,
                          //             ),
                          //             Text(
                          //               helpEn(context)
                          //                   ? "Become a merchant with us"
                          //                   : "اصبح تاجر معنا",
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.w800),
                          //             ),
                          //             SizedBox(
                          //               width: 8,
                          //             ),
                          //           ],
                          //         ),
                          //       )),
                          // ),
                          ...List.generate(
                            _isLoading ? 10 : categories.data.length ?? 0,
                            (index) => _isLoading
                                ? Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              bottom: 0, right: 5, left: 5),
                                          child:
                                              loadingShimmerWidget(75, 60, 10)),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 5, right: 5, left: 5),
                                          child:
                                              loadingShimmerWidget(75, 20, 10)),
                                    ],
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: InkWell(
                                      onTap: () {
                                        id =
                                            categories.data[index].categoriesId;
                                        title = categories
                                            .data[index].categoriesName;
                                        setState(() {});
                                        // print(id);
                                        // print(title);
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => ProductByCategoryScreen(
                                        //           id: ,
                                        //           title: categories
                                        //               .data[index].categoriesName,
                                        //         )));
                                      },
                                      child: helpClip(
                                          10,
                                          Container(
                                            alignment: Alignment.center,
                                            color: Color(0xFF143444),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  categories.data[index]
                                                      .categoriesName,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (id != null)
                    Expanded(
                      child: SizedBox(
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * 0.3
                              : double.infinity,
                          child: ProductByCategoryScreen(id: id, title: title)),
                    ),
                ],
              );
  }
}
