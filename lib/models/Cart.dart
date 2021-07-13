// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.cartId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  int cartId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<CartProduct> products;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartId: json["cart_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    products: List<CartProduct>.from(json["products"].map((x) => CartProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class CartProduct {
  CartProduct({
    this.cartProductId,
    this.cartId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.productDetail,
  });

  int cartProductId;
  int cartId;
  int productId;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  ProductDetail productDetail;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    cartProductId: json["cart_product_id"],
    cartId: json["cart_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productDetail: ProductDetail.fromJson(json["product_detail"]),
  );

  Map<String, dynamic> toJson() => {
    "cart_product_id": cartProductId,
    "cart_id": cartId,
    "product_id": productId,
    "quantity": quantity,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_detail": productDetail.toJson(),
  };
}

class ProductDetail {
  ProductDetail({
    this.productsToCategoriesId,
    this.productsId,
    this.categoriesId,
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
    this.dateAdded,
    this.lastModified,
    this.manufacturersImage,
    this.manufacturersUrl,
    this.discountPrice,
    this.categoriesDescriptionId,
    this.categoriesName,
    this.categoriesDescription,
  });

  int productsToCategoriesId;
  int productsId;
  int categoriesId;
  int productsQuantity;
  dynamic productsModel;
  String productsImage;
  dynamic productsVideoLink;
  String priceBuy;
  String productsPrice;
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
  dynamic dateAdded;
  dynamic lastModified;
  dynamic manufacturersImage;
  dynamic manufacturersUrl;
  dynamic discountPrice;
  int categoriesDescriptionId;
  String categoriesName;
  dynamic categoriesDescription;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    productsToCategoriesId: json["products_to_categories_id"],
    productsId: json["products_id"],
    categoriesId: json["categories_id"],
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
    dateAdded: json["date_added"],
    lastModified: json["last_modified"],
    manufacturersImage: json["manufacturers_image"],
    manufacturersUrl: json["manufacturers_url"],
    discountPrice: json["discount_price"],
    categoriesDescriptionId: json["categories_description_id"],
    categoriesName: json["categories_name"],
    categoriesDescription: json["categories_description"],
  );

  Map<String, dynamic> toJson() => {
    "products_to_categories_id": productsToCategoriesId,
    "products_id": productsId,
    "categories_id": categoriesId,
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
    "date_added": dateAdded,
    "last_modified": lastModified,
    "manufacturers_image": manufacturersImage,
    "manufacturers_url": manufacturersUrl,
    "discount_price": discountPrice,
    "categories_description_id": categoriesDescriptionId,
    "categories_name": categoriesName,
    "categories_description": categoriesDescription,
  };
}
