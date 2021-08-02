// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

import 'package:shop_app/models/search_product.dart';

FilterModel filterModelFromJson(String str) =>
    FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    this.success,
    this.productData,
    this.message,
    this.totalRecord,
  });

  String success;
  List<Products> productData;
  String message;
  int totalRecord;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        success: json["success"],
        productData: List<Products>.from(
            json["product_data"].map((x) => Products.fromJson(x))),
        message: json["message"],
        totalRecord: json["total_record"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "product_data": List<dynamic>.from(productData.map((x) => x.toJson())),
        "message": message,
        "total_record": totalRecord,
      };
}
