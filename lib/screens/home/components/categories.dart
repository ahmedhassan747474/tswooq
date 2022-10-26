import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/utils/api_categories.dart';

import '../../../models/vendors_model.dart';
import '../../popular_groups/popular_groups_screen.dart';
import '../../product_list/product_list_by_category_screen.dart';

class Categories extends StatefulWidget {
  final Vendor vendor;
  Categories(this.vendor);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  AllCategoriesModel categories = new AllCategoriesModel(data: []);
  bool _isLoading = true;
  String selectedTitle;
  int selectedId;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    categories = await ApiCategories.instance.allCategories();
    if (categories.data != null && categories.data.isNotEmpty) {
      selectedId = categories.data.first.categoriesId;
      selectedTitle = categories.data.first.categoriesName;
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
                          InkWell(
                            onTap: () {
                              //
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PopularGroupsScreen(widget.vendor)));
                            },
                            child: helpClip(
                                10,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  alignment: Alignment.center,
                                  color: Color(0xFF143444),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        helpEn(context)
                                            ? "عروض مميزة"
                                            : "Special Offers",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),

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
                            (index) {
                              if (_isLoading) {
                                return Column(
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
                                );
                              } else {
                                if (categories.data[index].totalProducts ==
                                        null ||
                                    categories.data[index].totalProducts == 0)
                                  return SizedBox();
                                else
                                  return Container(
                                    decoration: BoxDecoration(
                                      boxShadow: selectedId ==
                                              categories
                                                  .data[index].categoriesId
                                          ? [
                                              BoxShadow(
                                                color: Colors.black45,
                                                blurRadius: 1,
                                                offset: Offset(1, -1),
                                              ),
                                            ]
                                          : [],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: InkWell(
                                        onTap: () {
                                          selectedId = categories
                                              .data[index].categoriesId;
                                          selectedTitle = categories
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
                                  );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (selectedId != null)
                    Expanded(
                      child: SizedBox(
                          width: kIsWeb
                              ? MediaQuery.of(context).size.width * 0.5
                              : double.infinity,
                          child: ProductByCategoryScreen(
                              id: selectedId, title: selectedTitle)),
                    ),
                ],
              );
  }
}
