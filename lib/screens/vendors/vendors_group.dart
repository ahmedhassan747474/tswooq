import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/screens/home/components/popular_product.dart';
import 'package:tswooq/utils/api_home.dart';

class VendorGroupScreen extends StatefulWidget {
  Vendor vendor;
  VendorGroupScreen(this.vendor);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VendorGroupScreenState();
  }
}

class VendorGroupScreenState extends State<VendorGroupScreen> {
  bool isGridView = true;
  bool _isLoading = true;

  GroupModel groups = new GroupModel(data: []);
  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    groups =
        await ApiHome.instance.getGroups(id: "?vendor_id=${widget.vendor.id}");
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.vendor.name}",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? helpLoading()
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    groups.data.length,
                    (index) => groups.data[index].products?.length == 0
                        ? SizedBox()
                        : PopularProduct(groups.data[index]),
                  ),
                  SizedBox(
                    height: helpWidth(context) * .1,
                  ),
                ],
              ),
            ),
    );
  }
}
