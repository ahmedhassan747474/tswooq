import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/screens/vendors/vendors_group.dart';
import 'package:tswooq/utils/api_home.dart';

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
    vendors = await ApiHome.instance.getVendor();
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
      // width: getProportionateScreenWidth(widget.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.02,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: "vendor" + vendor.id.toString(),
                child: helpImage(vendor.avatar ?? "", 0),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                Center(
                  child: Text(
                    vendor.shopName ?? "shopName",
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
          crossAxisCount: 2,
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
                                vendors.data[index].id,
                              )));
                    },
                    child: cardView(vendors.data[index], context)));
          }),
    );
  }
}
