import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/loading_shimmer.dart';
import 'package:tswooq/models/all_categories.dart';
import 'package:tswooq/screens/product_list/product_list_by_category_screen.dart';
import 'package:tswooq/utils/api_categories.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  AllCategoriesModel categories = new AllCategoriesModel(data: []);
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    categories = await ApiCategories.instance.allCategories();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _isLoading ? 10 : categories.data.length ?? 0,
          itemBuilder: (ctx, index) => _isLoading
              ? Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 0, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 75, 10)),
                    Container(
                        margin: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: loadingShimmerWidget(75, 20, 10)),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductByCategoryScreen(
                                id: categories.data[index].categoriesId,
                                title: categories.data[index].categoriesName,
                              )));
                    },
                    child: helpClip(
                        10,
                        Container(
                          color: Color(0xFF143444),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories.data[index].categoriesName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        )
                        // icon: categories.data[index].icon,
                        // text: categories.data[index].categoriesName,
                        // cardWidth: helpMobile(context)
                        //     ? helpWidth(context) * .2
                        //     : helpWidth(context) * .1,
                        // imgHeight: helpWidth(context) * .19,
                        // imgWidth: helpWidth(context) * .19,
                        // press:
                        ),
                  ),
                ),
        ));
  }
}
