// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  ProductsModel({
    this.success,
    this.productData,
    this.message,
    this.totalRecord,
  });

  String success;
  List<Products> productData;
  String message;
  int totalRecord;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
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

class Products {
  Products({
    this.serverTime,
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
    this.discountPrice,
    this.currency,
    this.images,
    this.categories,
    this.rating,
    this.reviewedCustomers,
    this.defaultStock,
    this.isLiked,
    this.attributes,
  });

  int serverTime;
  int productsId;
  int productsQuantity;
  dynamic productsModel;
  String productsImage;
  dynamic productsVideoLink;
  String priceBuy;
  int productsPrice;
  ProductsDateAdded productsDateAdded;
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
  String productsLeftBanner;
  int productsLeftBannerStartDate;
  int productsLeftBannerExpireDate;
  String productsRightBanner;
  int productsRightBannerStartDate;
  int productsRightBannerExpireDate;
  dynamic discountPrice;
  Currency currency;
  List<Image> images;
  List<Category> categories;
  String rating;

  List<dynamic> reviewedCustomers;
  int defaultStock;
  String isLiked;
  List<Attribute> attributes;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        serverTime: json["server_time"],
        productsId: json["products_id"],
        productsQuantity: json["products_quantity"],
        productsModel: json["products_model"],
        productsImage: json["products_image"],
        productsVideoLink: json["products_video_link"],
        priceBuy: json["price_buy"],
        productsPrice: json["products_price"],
        productsDateAdded:
            productsDateAddedValues.map[json["products_date_added"]],
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
        productParentId: json["product_parent_id"] == null
            ? null
            : json["product_parent_id"],
        barcode: json["barcode"],
        id: json["id"],
        languageId: json["language_id"],
        productsName: json["products_name"],
        productsDescription: json["products_description"],
        productsUrl: json["products_url"],
        productsViewed: json["products_viewed"],
        productsLeftBanner: json["products_left_banner"] == null
            ? null
            : json["products_left_banner"],
        productsLeftBannerStartDate:
            json["products_left_banner_start_date"] == null
                ? null
                : json["products_left_banner_start_date"],
        productsLeftBannerExpireDate:
            json["products_left_banner_expire_date"] == null
                ? null
                : json["products_left_banner_expire_date"],
        productsRightBanner: json["products_right_banner"] == null
            ? null
            : json["products_right_banner"],
        productsRightBannerStartDate:
            json["products_right_banner_start_date"] == null
                ? null
                : json["products_right_banner_start_date"],
        productsRightBannerExpireDate:
            json["products_right_banner_expire_date"] == null
                ? null
                : json["products_right_banner_expire_date"],
        currency: currencyValues.map[json["currency"]],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        rating: json["rating"],
        reviewedCustomers:
            List<dynamic>.from(json["reviewed_customers"].map((x) => x)),
        defaultStock: json["defaultStock"],
        isLiked: json["isLiked"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "server_time": serverTime,
        "products_id": productsId,
        "products_quantity": productsQuantity,
        "products_model": productsModel,
        "products_image": productsImage,
        "products_video_link": productsVideoLink,
        "price_buy": priceBuy,
        "products_price": productsPrice,
        "products_date_added":
            productsDateAddedValues.reverse[productsDateAdded],
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
        "product_parent_id": productParentId == null ? null : productParentId,
        "barcode": barcode,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id": id,
        "language_id": languageId,
        "products_name": productsName,
        "products_description": productsDescription,
        "products_url": productsUrl,
        "products_viewed": productsViewed,
        "products_left_banner":
            productsLeftBanner == null ? null : productsLeftBanner,
        "products_left_banner_start_date": productsLeftBannerStartDate == null
            ? null
            : productsLeftBannerStartDate,
        "products_left_banner_expire_date": productsLeftBannerExpireDate == null
            ? null
            : productsLeftBannerExpireDate,
        "products_right_banner":
            productsRightBanner == null ? null : productsRightBanner,
        "products_right_banner_start_date": productsRightBannerStartDate == null
            ? null
            : productsRightBannerStartDate,
        "products_right_banner_expire_date":
            productsRightBannerExpireDate == null
                ? null
                : productsRightBannerExpireDate,
        "discount_price": discountPrice,
        "currency": currencyValues.reverse[currency],
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "rating": rating,
        "reviewed_customers":
            List<dynamic>.from(reviewedCustomers.map((x) => x)),
        "defaultStock": defaultStock,
        "isLiked": isLiked,
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.color,
    this.id,
    this.price,
    this.images,
    this.memory,
    this.size,
  });

  String color;
  int id;
  String price;
  List<Image> images;
  String memory;
  String size;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        color: json["color"],
        id: json["id"],
        price: json["price"].toString() ?? '',
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        memory: json["Memory"] == null ? null : json["Memory"],
        size: json["size"] == null ? null : json["size"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "id": id,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "Memory": memory == null ? null : memory,
        "size": size == null ? null : size,
      };
}

class Image {
  Image({
    this.id,
    this.productsId,
    this.image,
    this.htmlcontent,
    this.sortOrder,
    this.productsOptionsValuesId,
  });

  int id;
  int productsId;
  String image;
  dynamic htmlcontent;
  int sortOrder;
  dynamic productsOptionsValuesId;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productsId: json["products_id"],
        image: json["image"],
        htmlcontent: json["htmlcontent"],
        sortOrder: json["sort_order"],
        productsOptionsValuesId: json["products_options_values_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products_id": productsId,
        "image": image,
        "htmlcontent": htmlcontent,
        "sort_order": sortOrder,
        "products_options_values_id": productsOptionsValuesId,
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

// // To parse this JSON data, do
// //
// //     final productModel = productModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ProductsModel productModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));
//
// String productModelToJson(ProductsModel data) => json.encode(data.toJson());
//
// class ProductsModel {
//   ProductsModel({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });
//
//   int currentPage;
//   List<Products> data;
//   String firstPageUrl;
//   int from;
//   int lastPage;
//   String lastPageUrl;
//   String nextPageUrl;
//   String path;
//   dynamic perPage;
//   dynamic prevPageUrl;
//   int to;
//   int total;
//
//   factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
//     currentPage: json["current_page"],
//     data: List<Products>.from(json["data"].map((x) => Products.fromJson(x))),
//     firstPageUrl: json["first_page_url"],
//     from: json["from"],
//     lastPage: json["last_page"],
//     lastPageUrl: json["last_page_url"],
//     nextPageUrl: json["next_page_url"],
//     path: json["path"],
//     perPage: json["per_page"],
//     prevPageUrl: json["prev_page_url"],
//     to: json["to"],
//     total: json["total"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "current_page": currentPage,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "first_page_url": firstPageUrl,
//     "from": from,
//     "last_page": lastPage,
//     "last_page_url": lastPageUrl,
//     "next_page_url": nextPageUrl,
//     "path": path,
//     "per_page": perPage,
//     "prev_page_url": prevPageUrl,
//     "to": to,
//     "total": total,
//   };
// }
//
// class Products {
//   Products({
//     this.productsToCategoriesId,
//     this.productsId,
//     this.categoriesId,
//     this.productsQuantity,
//     this.productsModel,
//     this.priceBuy,
//     this.productsStatus,
//     this.isCurrent,
//     this.productsPrice,
//     this.productParentId,
//     this.productsSlug,
//     this.productsMinOrder,
//     this.barcode,
//     this.productsName,
//     this.productsDescription,
//     this.productsImage,
//     this.productsType,
//     this.productsMaxStock,
//     this.manufacturersUrl,
//     this.discountPrice,
//     this.categoriesDescriptionId,
//     this.languageId,
//     this.categoriesName,
//     this.categoriesDescription,
//     this.currency,
//     this.parallel,
//     this.images,
//     this.categories,
//     this.rating,
//     this.totalUserRated,
//     this.fiveRatio,
//     this.fourRatio,
//     this.threeRatio,
//     this.twoRatio,
//     this.oneRatio,
//     this.reviewedCustomers,
//     this.defaultStock,
//     this.isLiked,
//   });
//
//   int productsToCategoriesId;
//   int productsId;
//   int categoriesId;
//   int productsQuantity;
//   dynamic productsModel;
//   String priceBuy;
//   int productsStatus;
//   int isCurrent;
//   int productsPrice;
//   dynamic productParentId;
//   String productsSlug;
//   int productsMinOrder;
//   String barcode;
//   String productsName;
//   String productsDescription;
//   String productsImage;
//   int productsType;
//   dynamic productsMaxStock;
//   dynamic manufacturersUrl;
//   dynamic discountPrice;
//   int categoriesDescriptionId;
//   int languageId;
//   Categories categoriesName;
//   Categories categoriesDescription;
//   Currency currency;
//   List<dynamic> parallel;
//   List<dynamic> images;
//   List<Category> categories;
//   String rating;
//   int totalUserRated;
//   int fiveRatio;
//   int fourRatio;
//   int threeRatio;
//   int twoRatio;
//   int oneRatio;
//   List<dynamic> reviewedCustomers;
//   int defaultStock;
//   String isLiked;
//
//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//     productsToCategoriesId: json["products_to_categories_id"],
//     productsId: json["products_id"],
//     categoriesId: json["categories_id"],
//     productsQuantity: json["products_quantity"],
//     productsModel: json["products_model"],
//     priceBuy: json["price_buy"],
//     productsStatus: json["products_status"],
//     isCurrent: json["is_current"],
//     productsPrice: json["products_price"],
//     productParentId: json["product_parent_id"],
//     productsSlug: json["products_slug"],
//     productsMinOrder: json["products_min_order"],
//     barcode: json["barcode"],
//     productsName: json["products_name"],
//     productsDescription: json["products_description"],
//     productsImage: json["products_image"],
//     productsType: json["products_type"],
//     productsMaxStock: json["products_max_stock"],
//     manufacturersUrl: json["manufacturers_url"],
//     discountPrice: json["discount_price"],
//     categoriesDescriptionId: json["categories_description_id"],
//     languageId: json["language_id"],
//     categoriesName: categoriesValues.map[json["categories_name"]],
//     categoriesDescription: json["categories_description"] == null ? null : categoriesValues.map[json["categories_description"]],
//     currency: currencyValues.map[json["currency"]],
//     parallel: List<dynamic>.from(json["parallel"].map((x) => x)),
//     images: List<dynamic>.from(json["images"].map((x) => x)),
//     categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
//     rating: json["rating"],
//     totalUserRated: json["total_user_rated"],
//     fiveRatio: json["five_ratio"],
//     fourRatio: json["four_ratio"],
//     threeRatio: json["three_ratio"],
//     twoRatio: json["two_ratio"],
//     oneRatio: json["one_ratio"],
//     reviewedCustomers: List<dynamic>.from(json["reviewed_customers"].map((x) => x)),
//     defaultStock: json["defaultStock"],
//     isLiked: json["isLiked"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "products_to_categories_id": productsToCategoriesId,
//     "products_id": productsId,
//     "categories_id": categoriesId,
//     "products_quantity": productsQuantity,
//     "products_model": productsModel,
//     "price_buy": priceBuy,
//     "products_status": productsStatus,
//     "is_current": isCurrent,
//     "products_price": productsPrice,
//     "product_parent_id": productParentId,
//     "products_slug": productsSlug,
//     "products_min_order": productsMinOrder,
//     "barcode": barcode,
//     "products_name": productsName,
//     "products_description": productsDescription,
//     "products_image": productsImage,
//     "products_type": productsType,
//     "products_max_stock": productsMaxStock,
//     "manufacturers_url": manufacturersUrl,
//     "discount_price": discountPrice,
//     "categories_description_id": categoriesDescriptionId,
//     "language_id": languageId,
//     "categories_name": categoriesValues.reverse[categoriesName],
//     "categories_description": categoriesDescription == null ? null : categoriesValues.reverse[categoriesDescription],
//     "currency": currencyValues.reverse[currency],
//     "parallel": List<dynamic>.from(parallel.map((x) => x)),
//     "images": List<dynamic>.from(images.map((x) => x)),
//     "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
//     "rating": rating,
//     "total_user_rated": totalUserRated,
//     "five_ratio": fiveRatio,
//     "four_ratio": fourRatio,
//     "three_ratio": threeRatio,
//     "two_ratio": twoRatio,
//     "one_ratio": oneRatio,
//     "reviewed_customers": List<dynamic>.from(reviewedCustomers.map((x) => x)),
//     "defaultStock": defaultStock,
//     "isLiked": isLiked,
//   };
// }
//
// class Category {
//   Category({
//     this.categoriesId,
//     this.categoriesName,
//     this.categoriesImage,
//     this.categoriesIcon,
//     this.parentId,
//   });
//
//   int categoriesId;
//   Categories categoriesName;
//   String categoriesImage;
//   String categoriesIcon;
//   int parentId;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     categoriesId: json["categories_id"],
//     categoriesName: categoriesValues.map[json["categories_name"]],
//     categoriesImage: json["categories_image"],
//     categoriesIcon: json["categories_icon"],
//     parentId: json["parent_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "categories_id": categoriesId,
//     "categories_name": categoriesValues.reverse[categoriesName],
//     "categories_image": categoriesImage,
//     "categories_icon": categoriesIcon,
//     "parent_id": parentId,
//   };
// }
//
// enum Categories { ACCESSORIES, CABLES, WALL_CHARGER }
//
// final categoriesValues = EnumValues({
//   "Accessories": Categories.ACCESSORIES,
//   "cables": Categories.CABLES,
//   "Wall charger": Categories.WALL_CHARGER
// });
//
// enum Currency { SAR }
//
// final currencyValues = EnumValues({
//   "SAR": Currency.SAR
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
