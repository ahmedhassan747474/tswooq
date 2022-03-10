// To parse this JSON data, do
//
//     final allCategoriesModel = allCategoriesModelFromJson(jsonString);

import 'dart:convert';

AllCategoriesModel allCategoriesModelFromJson(String str) =>
    AllCategoriesModel.fromJson(json.decode(str));

String allCategoriesModelToJson(AllCategoriesModel data) =>
    json.encode(data.toJson());

class AllCategoriesModel {
  AllCategoriesModel({
    this.data,
    this.message,
    // this.categories,
  });

  List<Categories> data;
  String message;
  // int categories;

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      AllCategoriesModel(
        data: List<Categories>.from(
            json["data"].map((x) => Categories.fromJson(x))),
        message: json["message"] ?? "",
        // categories: json["categories"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        // "categories": categories,
      };
}

class Categories {
  Categories({
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

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categoriesId: json["categories_id"] ?? -1,
        categoriesName: json["categories_name"] ?? "",
        parentId: json["parent_id"] ?? -1,
        image: json["image"] ?? "",
        icon: json["icon"] ?? "",
        totalProducts: json["total_products"] ?? -1,
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
