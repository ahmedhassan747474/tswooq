import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/home_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/brands.dart';
import 'package:tswooq/screens/product_list/product_by_brand.dart';
import 'package:tswooq/translations/locale_keys.g.dart';

class BrandListScreen extends StatelessWidget {
  const BrandListScreen({
    Key key,
    @required this.brands,
  }) : super(key: key);

  final BrandsModel brands;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
          padding: EdgeInsets.all(6),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              // childAspectRatio: 2 / 3
            ),
            itemCount: brands.data.length ?? 0,
            itemBuilder: (ctx, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CategoryCard(
                icon: brands.data[index].icon,
                text: brands.data[index].categoriesName,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductBrandScreen(
                            id: brands.data[index].categoriesId,
                            title: brands.data[index].categoriesName,
                          )));
                },
                cardWidth: helpWidth(context) * .4,
                imgHeight: helpWidth(context) * .25,
                imgWidth: helpWidth(context) * .25,
              ),
            ),
          )),
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
