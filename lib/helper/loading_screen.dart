import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tswooq/utils/vars.dart';

class LoadingWidget extends StatelessWidget {
  final Indicator indicator;
  final Color color;

  const LoadingWidget({
    this.indicator = Indicator.ballClipRotateMultiple,
    this.color = AppColors.PRIMARY_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: Image.asset(
          "assets/logo.png",
        ),

//todo
//         LoadingIndicator(sss
// //          indicatorType: indicator,
//           indicatorType: indicator,
//           color: Color(0xFF0081B0),
// //          color: Colors.red,
//         ),
      ),
    );
  }
}

class LoadingScreen {
  LoadingScreen._();

  static show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                ),
                LoadingWidget(
//                  indicator: Indicator.squareSpin,
                  indicator: Indicator.orbit,
                  color: Colors.red,
//                  indicator: Indicator.ballScale,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
