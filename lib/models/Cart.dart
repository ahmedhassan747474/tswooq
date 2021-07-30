// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

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
  List<CartProduct> productData;
  String message;
  int totalRecord;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    success: json["success"],
    productData: List<CartProduct>.from(json["product_data"].map((x) => CartProduct.fromJson(x))),
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

class CartProduct {
  CartProduct({
    this.productsId,
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
    this.createdAt,
    this.updatedAt,
    this.manufacturerName,
    this.manufacturerImage,
    this.manufacturersSlug,
    this.dateAdded,
    this.lastModified,
    this.manufacturersImage,
    this.languagesId,
    this.manufacturersUrl,
    this.urlClicked,
    this.dateLastClick,
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
    this.imageId,
    this.imageType,
    this.height,
    this.width,
    this.path,
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
    this.defaultStock,
    this.isLiked,
    this.attributes,
  });

  int productsId;
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
  int productParentId;
  String barcode;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic manufacturerName;
  dynamic manufacturerImage;
  dynamic manufacturersSlug;
  dynamic dateAdded;
  dynamic lastModified;
  dynamic manufacturersImage;
  dynamic languagesId;
  dynamic manufacturersUrl;
  dynamic urlClicked;
  dynamic dateLastClick;
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
  int imageId;
  String imageType;
  int height;
  int width;
  String path;
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
  int defaultStock;
  String isLiked;
  List<Attribute> attributes;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    productsId: json["products_id"],
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
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    manufacturerName: json["manufacturer_name"],
    manufacturerImage: json["manufacturer_image"],
    manufacturersSlug: json["manufacturers_slug"],
    dateAdded: json["date_added"],
    lastModified: json["last_modified"],
    manufacturersImage: json["manufacturers_image"],
    languagesId: json["languages_id"],
    manufacturersUrl: json["manufacturers_url"],
    urlClicked: json["url_clicked"],
    dateLastClick: json["date_last_click"],
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
    imageId: json["image_id"],
    imageType: json["image_type"],
    height: json["height"],
    width: json["width"],
    path: json["path"],
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
    defaultStock: json["defaultStock"],
    isLiked: json["isLiked"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products_id": productsId,
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
    "created_at": createdAt,
    "updated_at": updatedAt,
    "manufacturer_name": manufacturerName,
    "manufacturer_image": manufacturerImage,
    "manufacturers_slug": manufacturersSlug,
    "date_added": dateAdded,
    "last_modified": lastModified,
    "manufacturers_image": manufacturersImage,
    "languages_id": languagesId,
    "manufacturers_url": manufacturersUrl,
    "url_clicked": urlClicked,
    "date_last_click": dateLastClick,
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
    "image_id": imageId,
    "image_type": imageType,
    "height": height,
    "width": width,
    "path": path,
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
    "defaultStock": defaultStock,
    "isLiked": isLiked,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
  };
}

class Attribute {
  Attribute({
    this.memory,
    this.id,
    this.price,
    this.homeImage,
    this.images,
  });

  String memory;
  int id;
  int price;
  String homeImage;
  List<dynamic> images;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    memory: json["Memory"],
    id: json["id"],
    price: json["price"],
    homeImage: json["home_image"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Memory": memory,
    "id": id,
    "price": price,
    "home_image": homeImage,
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
