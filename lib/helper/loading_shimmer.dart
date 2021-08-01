import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingShimmerWidget(double width, double height, double radius) {
  return Container(
    decoration: BoxDecoration(
      // color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: Shimmer.fromColors(
        baseColor: Colors.black38,
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(radius),
          ),
          height: height,
          width: width,
        )),
  );
}
