// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  FavModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.productsToCategoriesId,
    this.productsId,
    this.categoriesId,
    this.productsQuantity,
    this.productsModel,
    this.priceBuy,
    this.productsStatus,
    this.isCurrent,
    this.productsPrice,
    this.productParentId,
    this.productsSlug,
    this.productsMinOrder,
    this.barcode,
    this.productsName,
    this.productsDescription,
    this.productsImage,
    this.productsType,
    this.productsMaxStock,
    this.manufacturersUrl,
    this.discountPrice,
    this.categoriesDescriptionId,
    this.languageId,
    this.categoriesName,
    this.categoriesDescription,
    this.currency,
    this.parallel,
    this.images,
    this.categories,
    this.rating,
    this.totalUserRated,
    this.fiveRatio,
    this.fourRatio,
    this.threeRatio,
    this.twoRatio,
    this.oneRatio,
    this.reviewedCustomers,
    this.defaultStock,
    this.isLiked,
  });

  int productsToCategoriesId;
  int productsId;
  int categoriesId;
  int productsQuantity;
  dynamic productsModel;
  String priceBuy;
  int productsStatus;
  int isCurrent;
  int productsPrice;
  dynamic productParentId;
  String productsSlug;
  int productsMinOrder;
  String barcode;
  String productsName;
  String productsDescription;
  String productsImage;
  int productsType;
  int productsMaxStock;
  dynamic manufacturersUrl;
  dynamic discountPrice;
  int categoriesDescriptionId;
  int languageId;
  String categoriesName;
  String categoriesDescription;
  String currency;
  List<dynamic> parallel;
  List<dynamic> images;
  List<Category> categories;
  String rating;
  int totalUserRated;
  int fiveRatio;
  int fourRatio;
  int threeRatio;
  int twoRatio;
  int oneRatio;
  List<dynamic> reviewedCustomers;
  int defaultStock;
  String isLiked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productsToCategoriesId: json["products_to_categories_id"],
    productsId: json["products_id"],
    categoriesId: json["categories_id"],
    productsQuantity: json["products_quantity"],
    productsModel: json["products_model"],
    priceBuy: json["price_buy"],
    productsStatus: json["products_status"],
    isCurrent: json["is_current"],
    productsPrice: json["products_price"],
    productParentId: json["product_parent_id"],
    productsSlug: json["products_slug"],
    productsMinOrder: json["products_min_order"],
    barcode: json["barcode"],
    productsName: json["products_name"],
    productsDescription: json["products_description"],
    productsImage: json["products_image"],
    productsType: json["products_type"],
    productsMaxStock: json["products_max_stock"],
    manufacturersUrl: json["manufacturers_url"],
    discountPrice: json["discount_price"],
    categoriesDescriptionId: json["categories_description_id"],
    languageId: json["language_id"],
    categoriesName: json["categories_name"],
    categoriesDescription: json["categories_description"],
    currency: json["currency"],
    parallel: List<dynamic>.from(json["parallel"].map((x) => x)),
    images: List<dynamic>.from(json["images"].map((x) => x)),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    rating: json["rating"],
    totalUserRated: json["total_user_rated"],
    fiveRatio: json["five_ratio"],
    fourRatio: json["four_ratio"],
    threeRatio: json["three_ratio"],
    twoRatio: json["two_ratio"],
    oneRatio: json["one_ratio"],
    reviewedCustomers: List<dynamic>.from(json["reviewed_customers"].map((x) => x)),
    defaultStock: json["defaultStock"],
    isLiked: json["isLiked"],
  );

  Map<String, dynamic> toJson() => {
    "products_to_categories_id": productsToCategoriesId,
    "products_id": productsId,
    "categories_id": categoriesId,
    "products_quantity": productsQuantity,
    "products_model": productsModel,
    "price_buy": priceBuy,
    "products_status": productsStatus,
    "is_current": isCurrent,
    "products_price": productsPrice,
    "product_parent_id": productParentId,
    "products_slug": productsSlug,
    "products_min_order": productsMinOrder,
    "barcode": barcode,
    "products_name": productsName,
    "products_description": productsDescription,
    "products_image": productsImage,
    "products_type": productsType,
    "products_max_stock": productsMaxStock,
    "manufacturers_url": manufacturersUrl,
    "discount_price": discountPrice,
    "categories_description_id": categoriesDescriptionId,
    "language_id": languageId,
    "categories_name": categoriesName,
    "categories_description": categoriesDescription,
    "currency": currency,
    "parallel": List<dynamic>.from(parallel.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "rating": rating,
    "total_user_rated": totalUserRated,
    "five_ratio": fiveRatio,
    "four_ratio": fourRatio,
    "three_ratio": threeRatio,
    "two_ratio": twoRatio,
    "one_ratio": oneRatio,
    "reviewed_customers": List<dynamic>.from(reviewedCustomers.map((x) => x)),
    "defaultStock": defaultStock,
    "isLiked": isLiked,
  };
}

class Category {
  Category({
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.categoriesIcon,
    this.parentId,
  });

  int categoriesId;
  String categoriesName;
  String categoriesImage;
  String categoriesIcon;
  int parentId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoriesId: json["categories_id"],
    categoriesName: json["categories_name"],
    categoriesImage: json["categories_image"],
    categoriesIcon: json["categories_icon"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "categories_id": categoriesId,
    "categories_name": categoriesName,
    "categories_image": categoriesImage,
    "categories_icon": categoriesIcon,
    "parent_id": parentId,
  };
}
