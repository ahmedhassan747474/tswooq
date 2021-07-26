import 'package:flutter/material.dart';
import 'package:shop_app/components/home_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shop_app/models/brands.dart';
import 'package:shop_app/translations/locale_keys.g.dart';

import '../../size_config.dart';



class BrandListScreen extends StatelessWidget {
  const BrandListScreen({
    Key key,
    @required this.brands,
  }) : super(key: key);


  final BrandsModel brands;
  static String routeName = "/brands";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body:  Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: GridView.builder(
            // shrinkWrap: true,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 2 / 3
            ),
            itemCount: brands.data.length ?? 0,
            itemBuilder: (ctx,index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CategoryCard(
                icon: brands.data[index].icon,
                text: brands.data[index].categoriesName,
                press: () {},
                cardWidth: 160,
                imgHeight: 120,
                imgWidth: 120,
              ),
            ),
          )
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            LocaleKeys.Brands_translate.tr(),
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
