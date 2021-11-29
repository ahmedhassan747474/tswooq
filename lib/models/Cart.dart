// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:tswooq/models/search_product.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.success,
    this.productData,
    this.message,
    this.totalRecord,
  });

  String success;
  List<Products> productData;
  String message;
  int totalRecord;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productData:
            List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
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
