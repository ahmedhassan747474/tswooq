// To parse this JSON data, do
//
//     final brandsModel = brandsModelFromJson(jsonString);

import 'dart:convert';

BrandsModel brandsModelFromJson(String str) => BrandsModel.fromJson(json.decode(str));

String brandsModelToJson(BrandsModel data) => json.encode(data.toJson());

class BrandsModel {
  BrandsModel({
    this.success,
    this.data,
    this.message,
    this.categories,
  });

  String success;
  List<Datum> data;
  String message;
  int categories;

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    success: json["success"] ??"",
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"]??"",
    categories: json["categories"]??-1,
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "categories": categories,
  };
}

class Datum {
  Datum({
    this.categoriesId,
    this.categoriesName,
    this.parentId,
    this.image,
    this.icon,
    this.totalProducts,
  });

  int categoriesId;
  String categoriesName;
  int parentId;
  String image;
  String icon;
  int totalProducts;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoriesId: json["categories_id"]?? -1,
    categoriesName: json["categories_name"]?? "",
    parentId: json["parent_id"] ??-1,
    image: json["image"] ??"",
    icon: json["icon"] ??"",
    totalProducts: json["total_products"]?? -1,
  );

  Map<String, dynamic> toJson() => {
    "categories_id": categoriesId,
    "categories_name": categoriesName,
    "parent_id": parentId,
    "image": image,
    "icon": icon,
    "total_products": totalProducts,
  };
}
