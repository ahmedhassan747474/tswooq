import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/utils/api_categories.dart';

import '../../../models/vendors_model.dart';
import '../product_list/product_list_by_category_screen.dart';

class ProductsByBrandsScreen extends StatefulWidget {
  final Vendor vendor;
  ProductsByBrandsScreen(this.vendor);
  @override
  _ProductsByBrandsScreenState createState() => _ProductsByBrandsScreenState();
}

class _ProductsByBrandsScreenState extends State<ProductsByBrandsScreen> {
  AllCategoriesModel brands = new AllCategoriesModel(data: []);
  bool _isLoading = true;
  String selectedTitle;
  int selectedId;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    brands = await ApiCategories.instance.allBrands();
    if (brands.data != null && brands.data.isNotEmpty) {
      selectedId = brands.data.first.categoriesId;
      selectedTitle = brands.data.first.categoriesName;
    }
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: helpLoading())
        : (brands.data == null && brands.data.isEmpty)
            ? Scaffold(
                appBar: !kIsWeb
                    ? AppBar(
                        title: Text(
                          helpEn(context) ? "Brands" : "علامات تجارية",
                          style: TextStyle(color: Colors.black),
                        ),
                        centerTitle: true,
                      )
                    : null,
                body: Center(
                  child: Text(helpEn(context)
                      ? "No Brands for this Store"
                      : "لا يوجد علامات تجارية لهذا المتجر"),
                ),
              )
            : Scaffold(
                appBar: !kIsWeb
                    ? AppBar(
                        title: Text(
                          helpEn(context) ? "Brands" : "علامات تجارية",
                          style: TextStyle(color: Colors.black),
                        ),
                        centerTitle: true,
                      )
                    : null,
                body: Column(
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
                            ...List.generate(
                              _isLoading ? 10 : brands.data.length ?? 0,
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
                                  if (brands.data[index].totalProducts ==
                                          null ||
                                      brands.data[index].totalProducts == 0)
                                    return SizedBox();
                                  else
                                    return Container(
                                      decoration: BoxDecoration(
                                        boxShadow: selectedId ==
                                                brands.data[index].categoriesId
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
                                            selectedId =
                                                brands.data[index].categoriesId;
                                            selectedTitle = brands
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
                                                      brands.data[index]
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
                ),
              );
  }
}
