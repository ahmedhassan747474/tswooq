import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../helper/help.dart';
import '../../models/groub_model.dart';
import '../../models/vendors_model.dart';
import '../../utils/api_home.dart';
import '../home/components/popular_product.dart';

class PopularGroupsScreen extends StatefulWidget {
  final Vendor vendor;
  const PopularGroupsScreen(this.vendor, {Key key}) : super(key: key);

  @override
  State<PopularGroupsScreen> createState() => _PopularGroupsScreenState();
}

class _PopularGroupsScreenState extends State<PopularGroupsScreen> {
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
    if (_isLoading)
      return Center(child: helpLoading());
    else
      return Center(
        child: SizedBox(
          width: kIsWeb
              ? MediaQuery.of(context).size.width * 0.6
              : double.infinity,
          child: Center(
            child: SafeArea(
              child: Scaffold(
                // appBar: !kIsWeb
                //     ? AppBar(
                //         title: Text(
                //           "${widget.vendor.name}",
                //           style: TextStyle(color: Colors.black),
                //         ),
                //         centerTitle: true,
                //       )
                //     : null,
                body: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        groups.data.length,
                        (index) => groups.data[index].products?.length == 0
                            ? SizedBox()
                            : PopularProduct(groups.data[index]),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      );
  }
}
