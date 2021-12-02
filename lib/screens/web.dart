// import 'dart:io';
// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:tswooq/components/loading_screen.dart';
import 'package:tswooq/screens/home/home_screen.dart';
import 'package:tswooq/utils/vars.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class OrderView extends StatefulWidget {
  final String url;
  OrderView(this.url);
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      appBar: AppBar(
        title: Text(
          'الدفع',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.PRIMARY_COLOR,
            ),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen()),
                  (route) => false);
            }),
        elevation: 0,
      ),
      body: Stack(
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: [
          WebView(
            initialUrl: '${widget.url}',
            javascriptMode: JavascriptMode.unrestricted,
            // gestureNavigationEnabled: false,
            // debuggingEnabled: false,
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          // isLoading
          //     ? Container(
          //         child: LoadingWidget(color: Colors.red), color: Colors.white)
          //     : SizedBox()
        ],
      ),
    );
  }
}
