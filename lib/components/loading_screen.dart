import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:tswooq/utils/vars.dart';

class LoadingWidget extends StatelessWidget {
  final Indicator indicator;
  final Color color;

  const LoadingWidget({
    Key key,
    this.indicator = Indicator.ballClipRotateMultiple,
    this.color = AppColors.PRIMARY_COLOR,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: Image.asset(
          "assets/logo.png",
        ),
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
                LoadingWidget(
                  indicator: Indicator.orbit,
                  color: Color(0xFF0081B0),
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
