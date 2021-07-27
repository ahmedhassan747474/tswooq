// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

FilterModel filterModelFromJson(String str) => FilterModel.fromJson(json.decode(str));

String filterModelToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    this.success,
    this.productData,
    this.message,
    this.totalRecord,
  });

  String success;
  List<ProductDatum> productData;
  String message;
  int totalRecord;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
    success: json["success"],
    productData: List<ProductDatum>.from(json["product_data"].map((x) => ProductDatum.fromJson(x))),
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

class ProductDatum {
  ProductDatum({
    this.productsToCategoriesId,
    this.productsId,
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.categoriesIcon,
    this.parentId,
    this.sortOrder,
    this.dateAdded,
    this.lastModified,
    this.categoriesSlug,
    this.categoriesStatus,
    this.createdAt,
    this.updatedAt,
    this.productsQuantity,
    this.productsModel,
    this.productsImage,
    this.productsVideoLink,
    this.priceBuy,
    this.productsPrice,
    this.productsDateAdded,
    this.productsLastModified,
    this.productsDateAvailable,
    this.productsWeight,
    this.productsWeightUnit,
    this.productsStatus,
    this.isCurrent,
    this.productsTaxClassId,
    this.manufacturersId,
    this.productsOrdered,
    this.productsLiked,
    this.lowLimit,
    this.isFeature,
    this.productsSlug,
    this.productsType,
    this.productsMinOrder,
    this.productsMaxStock,
    this.isShowWeb,
    this.isShowApp,
    this.isShowAdmin,
    this.adminId,
    this.productParentId,
    this.barcode,
    this.id,
    this.languageId,
    this.productsName,
    this.productsDescription,
    this.productsUrl,
    this.productsViewed,
    this.productsLeftBanner,
    this.productsLeftBannerStartDate,
    this.productsLeftBannerExpireDate,
    this.productsRightBanner,
    this.productsRightBannerStartDate,
    this.productsRightBannerExpireDate,
    this.manufacturerName,
    this.manufacturerImage,
    this.manufacturersSlug,
    this.manufacturersImage,
    this.manufacturersUrl,
    this.discountPrice,
    this.currency,
    this.categories,
    this.rating,
    this.totalUserRated,
    this.fiveRatio,
    this.fourRatio,
    this.threeRatio,
    this.twoRatio,
    this.oneRatio,
    this.reviewedCustomers,
    this.isLiked,
    this.defaultStock,
    this.attributes,
    this.images,
  });

  int productsToCategoriesId;
  int productsId;
  int categoriesId;
  String categoriesName;
  String categoriesImage;
  String categoriesIcon;
  int parentId;
  dynamic sortOrder;
  dynamic dateAdded;
  dynamic lastModified;
  String categoriesSlug;
  int categoriesStatus;
  dynamic createdAt;
  dynamic updatedAt;
  int productsQuantity;
  dynamic productsModel;
  String productsImage;
  dynamic productsVideoLink;
  String priceBuy;
  int productsPrice;
  String productsDateAdded;
  dynamic productsLastModified;
  dynamic productsDateAvailable;
  dynamic productsWeight;
  dynamic productsWeightUnit;
  int productsStatus;
  int isCurrent;
  int productsTaxClassId;
  dynamic manufacturersId;
  int productsOrdered;
  int productsLiked;
  int lowLimit;
  int isFeature;
  String productsSlug;
  int productsType;
  int productsMinOrder;
  dynamic productsMaxStock;
  String isShowWeb;
  String isShowApp;
  String isShowAdmin;
  int adminId;
  dynamic productParentId;
  String barcode;
  int id;
  int languageId;
  String productsName;
  String productsDescription;
  dynamic productsUrl;
  int productsViewed;
  dynamic productsLeftBanner;
  int productsLeftBannerStartDate;
  int productsLeftBannerExpireDate;
  dynamic productsRightBanner;
  int productsRightBannerStartDate;
  int productsRightBannerExpireDate;
  dynamic manufacturerName;
  dynamic manufacturerImage;
  dynamic manufacturersSlug;
  dynamic manufacturersImage;
  dynamic manufacturersUrl;
  dynamic discountPrice;
  String currency;
  List<Category> categories;
  String rating;
  int totalUserRated;
  int fiveRatio;
  int fourRatio;
  int threeRatio;
  int twoRatio;
  int oneRatio;
  List<dynamic> reviewedCustomers;
  String isLiked;
  int defaultStock;
  List<Attribute> attributes;
  List<dynamic> images;

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    productsToCategoriesId: json["products_to_categories_id"],
    productsId: json["products_id"],
    categoriesId: json["categories_id"],
    categoriesName: json["categories_name"],
    categoriesImage: json["categories_image"],
    categoriesIcon: json["categories_icon"],
    parentId: json["parent_id"],
    sortOrder: json["sort_order"],
    dateAdded: json["date_added"],
    lastModified: json["last_modified"],
    categoriesSlug: json["categories_slug"],
    categoriesStatus: json["categories_status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    productsQuantity: json["products_quantity"],
    productsModel: json["products_model"],
    productsImage: json["products_image"],
    productsVideoLink: json["products_video_link"],
    priceBuy: json["price_buy"],
    productsPrice: json["products_price"],
    productsDateAdded: json["products_date_added"],
    productsLastModified: json["products_last_modified"],
    productsDateAvailable: json["products_date_available"],
    productsWeight: json["products_weight"],
    productsWeightUnit: json["products_weight_unit"],
    productsStatus: json["products_status"],
    isCurrent: json["is_current"],
    productsTaxClassId: json["products_tax_class_id"],
    manufacturersId: json["manufacturers_id"],
    productsOrdered: json["products_ordered"],
    productsLiked: json["products_liked"],
    lowLimit: json["low_limit"],
    isFeature: json["is_feature"],
    productsSlug: json["products_slug"],
    productsType: json["products_type"],
    productsMinOrder: json["products_min_order"],
    productsMaxStock: json["products_max_stock"],
    isShowWeb: json["is_show_web"],
    isShowApp: json["is_show_app"],
    isShowAdmin: json["is_show_admin"],
    adminId: json["admin_id"],
    productParentId: json["product_parent_id"],
    barcode: json["barcode"],
    id: json["id"],
    languageId: json["language_id"],
    productsName: json["products_name"],
    productsDescription: json["products_description"],
    productsUrl: json["products_url"],
    productsViewed: json["products_viewed"],
    productsLeftBanner: json["products_left_banner"],
    productsLeftBannerStartDate: json["products_left_banner_start_date"],
    productsLeftBannerExpireDate: json["products_left_banner_expire_date"],
    productsRightBanner: json["products_right_banner"],
    productsRightBannerStartDate: json["products_right_banner_start_date"],
    productsRightBannerExpireDate: json["products_right_banner_expire_date"],
    manufacturerName: json["manufacturer_name"],
    manufacturerImage: json["manufacturer_image"],
    manufacturersSlug: json["manufacturers_slug"],
    manufacturersImage: json["manufacturers_image"],
    manufacturersUrl: json["manufacturers_url"],
    discountPrice: json["discount_price"],
    currency: json["currency"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    rating: json["rating"],
    totalUserRated: json["total_user_rated"],
    fiveRatio: json["five_ratio"],
    fourRatio: json["four_ratio"],
    threeRatio: json["three_ratio"],
    twoRatio: json["two_ratio"],
    oneRatio: json["one_ratio"],
    reviewedCustomers: List<dynamic>.from(json["reviewed_customers"].map((x) => x)),
    isLiked: json["isLiked"],
    defaultStock: json["defaultStock"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "products_to_categories_id": productsToCategoriesId,
    "products_id": productsId,
    "categories_id": categoriesId,
    "categories_name": categoriesName,
    "categories_image": categoriesImage,
    "categories_icon": categoriesIcon,
    "parent_id": parentId,
    "sort_order": sortOrder,
    "date_added": dateAdded,
    "last_modified": lastModified,
    "categories_slug": categoriesSlug,
    "categories_status": categoriesStatus,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "products_quantity": productsQuantity,
    "products_model": productsModel,
    "products_image": productsImage,
    "products_video_link": productsVideoLink,
    "price_buy": priceBuy,
    "products_price": productsPrice,
    "products_date_added": productsDateAdded,
    "products_last_modified": productsLastModified,
    "products_date_available": productsDateAvailable,
    "products_weight": productsWeight,
    "products_weight_unit": productsWeightUnit,
    "products_status": productsStatus,
    "is_current": isCurrent,
    "products_tax_class_id": productsTaxClassId,
    "manufacturers_id": manufacturersId,
    "products_ordered": productsOrdered,
    "products_liked": productsLiked,
    "low_limit": lowLimit,
    "is_feature": isFeature,
    "products_slug": productsSlug,
    "products_type": productsType,
    "products_min_order": productsMinOrder,
    "products_max_stock": productsMaxStock,
    "is_show_web": isShowWeb,
    "is_show_app": isShowApp,
    "is_show_admin": isShowAdmin,
    "admin_id": adminId,
    "product_parent_id": productParentId,
    "barcode": barcode,
    "id": id,
    "language_id": languageId,
    "products_name": productsName,
    "products_description": productsDescription,
    "products_url": productsUrl,
    "products_viewed": productsViewed,
    "products_left_banner": productsLeftBanner,
    "products_left_banner_start_date": productsLeftBannerStartDate,
    "products_left_banner_expire_date": productsLeftBannerExpireDate,
    "products_right_banner": productsRightBanner,
    "products_right_banner_start_date": productsRightBannerStartDate,
    "products_right_banner_expire_date": productsRightBannerExpireDate,
    "manufacturer_name": manufacturerName,
    "manufacturer_image": manufacturerImage,
    "manufacturers_slug": manufacturersSlug,
    "manufacturers_image": manufacturersImage,
    "manufacturers_url": manufacturersUrl,
    "discount_price": discountPrice,
    "currency": currency,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "rating": rating,
    "total_user_rated": totalUserRated,
    "five_ratio": fiveRatio,
    "four_ratio": fourRatio,
    "three_ratio": threeRatio,
    "two_ratio": twoRatio,
    "one_ratio": oneRatio,
    "reviewed_customers": List<dynamic>.from(reviewedCustomers.map((x) => x)),
    "isLiked": isLiked,
    "defaultStock": defaultStock,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

class Attribute {
  Attribute({
    this.memory,
    this.color,
    this.id,
    this.price,
    this.images,
  });

  String memory;
  String color;
  int id;
  int price;
  List<dynamic> images;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    memory: json["Memory"],
    color: json["color"],
    id: json["id"],
    price: json["price"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Memory": memory,
    "color": color,
    "id": id,
    "price": price,
    "images": List<dynamic>.from(images.map((x) => x)),
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
