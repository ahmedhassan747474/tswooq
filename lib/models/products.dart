// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

import 'package:tswooq/models/search_product.dart';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.success,
    this.productData,
    this.message,
    this.totalRecord,
    this.lastPage,
    this.to,
  });

  String success;
  List<Products> productData;
  String message;
  int totalRecord;
  String firstPageUrl;
  int lastPage = 30;
  int to = 30;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        // success: json["success"],
        productData:
            List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
        message: json["message"],
        totalRecord: json["total_record"],
        lastPage: json["last_page"] ?? 30,
        to: json["to"] ?? 30,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "product_data": List<dynamic>.from(productData.map((x) => x.toJson())),
        "message": message,
        "total_record": totalRecord,
      };
}

enum Currency { SAR }

final currencyValues = EnumValues({"SAR": Currency.SAR});

enum ProductsDateAdded { THE_00000000000000 }

final productsDateAddedValues =
    EnumValues({"0000-00-00 00:00:00": ProductsDateAdded.THE_00000000000000});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
