import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/screens/vendors/vendors_group.dart';
import 'package:tswooq/utils/api_vendor.dart';

import '../../constants.dart';
import '../../size_config.dart';

class VendorsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VendorsScreenState();
  }
}

class VendorsScreenState extends State<VendorsScreen> {
  VendorsModel vendors = new VendorsModel();
  bool isGridView = true;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    // product = await ApiProducts.instance.getProductsByBrand(widget.id);
    // //
    vendors = await ApiVendor.instance.getVendor();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            helpEn(context) ? "Vendors" : "متاجر",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: _isLoading ? helpLoading() : gridView(vendors, context));
  }

  Widget cardView(Vendor vendor, BuildContext context) {
    return SizedBox(
      width: kIsWeb ? 400 : helpWidth(context) * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: "vendor" + vendor.id.toString(),
                  child: helpImage(vendor.imagePath ?? "", 0),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 2,
            // height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    vendor.name ?? "shopName",
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow.visible,
                    // maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gridView(VendorsModel vendors, BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: kIsWeb
              ? helpWidth(context) > 600
                  ? 3
                  : 2
              : 2,
          crossAxisSpacing: 10,
          staggeredTileBuilder: (_) =>
              StaggeredTile.extent(1, helpHeight(context) * .4),
          // //  controller: popularProvider.scrollController,/
          itemCount: vendors.data.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VendorGroupScreen(
                                vendors.data[index],
                              )));
                    },
                    child: cardView(vendors.data[index], context)));
          }),
    );
  }
}
