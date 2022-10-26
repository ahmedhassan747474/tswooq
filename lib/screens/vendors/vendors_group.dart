import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tswooq/helper/help.dart';
import 'package:tswooq/models/groub_model.dart';
import 'package:tswooq/models/vendors_model.dart';
import 'package:tswooq/utils/api_home.dart';

import '../home/components/categories.dart';

class VendorGroupScreen extends StatefulWidget {
  Vendor vendor;
  VendorGroupScreen(this.vendor);
  @override
  State<StatefulWidget> createState() {
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
      appBar: !kIsWeb
          ? AppBar(
              title: Text(
                "${widget.vendor.name}",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            )
          : null,
      body: _isLoading
          ? helpLoading()
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (kIsWeb)
                      Text(
                        "${widget.vendor.name}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    if (kIsWeb)
                      SizedBox(
                        height: 20,
                      ),
                    Expanded(child: Categories(widget.vendor)),
                  ],
                ),
              ),
            ),
    );
  }
}
