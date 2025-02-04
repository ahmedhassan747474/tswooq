import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/product_card.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/screens/details/details_screen.dart';
import 'package:tswooq/screens/home/components/section_title.dart';
import 'package:tswooq/screens/product_list/product_list.dart';

import '../../../size_config.dart';

class PopularProduct extends StatefulWidget {
  final Group group;
  PopularProduct(this.group);
  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    print(helpEn(context));
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kIsWeb ? 0 : getProportionateScreenWidth(20)),
            child: SectionTitle(
              title:
                  (helpEn(context) ? widget.group.nameAr : widget.group.nameEn),
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductListScreen(
                      product: widget.group.products,
                    ),
                  ),
                );
              },
            ),
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
                // widget.group.products[index].attributes.isEmpty
                //     ? SizedBox()
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
                  product: widget.group.products[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
