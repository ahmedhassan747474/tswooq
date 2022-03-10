import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/components/fotter_widget.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/helper/slider.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/utils/api_home.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GroupModel groups = new GroupModel(data: []);
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    groups = await ApiHome.instance.getGroups();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 20 : 0),
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  HomeHeader(),
                  Container(height: 70, child: Categories()),
                  // SizedBox(height: getProportionateScreenHeight(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kIsWeb
                            ? helpWidth(context) > 600
                                ? 70
                                : 20
                            : 20),
                    child: ImageSlider(),
                  ),
                  // SizedBox(height: helpWidth(context) * .05),
                  //
                  // Container(
                  //     height: helpMobile(context)
                  //         ? helpHeight(context) * .40
                  //         : helpHeight(context) * .40,
                  //     child: LikeCardScreen()),
                  SizedBox(
                      height: kIsWeb ? 30 : getProportionateScreenWidth(30)),
                  Padding(
                    padding: EdgeInsets.all(helpWidth(context) > 600 ? 50 : 16),
                    child: Column(
                      children: [
                        ...List.generate(
                          groups.data.length,
                          (index) => groups.data[index].products?.length == 0
                              ? SizedBox()
                              : PopularProduct(groups.data[index]),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: helpWidth(context) * .1,
                  ),
                ],
              ),
            ),
            if (kIsWeb) FooterWidget()
          ],
        ),
      ),
    );
  }
}
