class SearchProduct {
  String success;
  List<ProductData> productData;
  String message;
  int totalRecord;

  SearchProduct(
      {this.success, this.productData, this.message, this.totalRecord});

  SearchProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['product_data'] != null) {
      productData = new List<ProductData>();
      json['product_data'].forEach((v) {
        productData.add(new ProductData.fromJson(v));
      });
    }
    message = json['message'];
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.productData != null) {
      data['product_data'] = this.productData.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['total_record'] = this.totalRecord;
    return data;
  }
}

class ProductData {
  int productsToCategoriesId;
  int productsId;
  int categoriesId;
  int productsQuantity;
  Null productsModel;
  String productsImage;
  Null productsVideoLink;
  String priceBuy;
  int productsPrice;
  String productsDateAdded;
  String productsLastModified;
  String productsDateAvailable;
  String productsWeight;
  String productsWeightUnit;
  int productsStatus;
  int isCurrent;
  int productsTaxClassId;
  String manufacturersId;
  int productsOrdered;
  int productsLiked;
  int lowLimit;
  int isFeature;
  String productsSlug;
  int productsType;
  int productsMinOrder;
  String productsMaxStock;
  String isShowWeb;
  String isShowApp;
  String isShowAdmin;
  int adminId;
  String productParentId;
  String barcode;
  String createdAt;
  String updatedAt;
  int id;
  int languageId;
  String productsName;
  String productsDescription;
  String productsUrl;
  int productsViewed;
  String productsLeftBanner;
  String productsLeftBannerStartDate;
  String productsLeftBannerExpireDate;
  String productsRightBanner;
  String productsRightBannerStartDate;
  String productsRightBannerExpireDate;
  String manufacturerName;
  String manufacturerImage;
  String manufacturersSlug;
  String dateAdded;
  String lastModified;
  String manufacturersImage;
  String manufacturersUrl;
  String discountPrice;
  String currency;
  List<Categories> categories;
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
  List<Attributes> attributes;

  ProductData(
      {this.productsToCategoriesId,
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
      this.attributes});

  ProductData.fromJson(Map<String, dynamic> json) {
    productsToCategoriesId = json['products_to_categories_id'];
    productsId = json['products_id'];
    categoriesId = json['categories_id'];
    productsQuantity = json['products_quantity'];
    productsModel = json['products_model'];
    productsImage = json['products_image'];
    productsVideoLink = json['products_video_link'];
    priceBuy = json['price_buy'];
    productsPrice = json['products_price'];
    productsDateAdded = json['products_date_added'];
    productsLastModified = json['products_last_modified'];
    productsDateAvailable = json['products_date_available'];
    productsWeight = json['products_weight'];
    productsWeightUnit = json['products_weight_unit'];
    productsStatus = json['products_status'];
    isCurrent = json['is_current'];
    productsTaxClassId = json['products_tax_class_id'];
    manufacturersId = json['manufacturers_id'];
    productsOrdered = json['products_ordered'];
    productsLiked = json['products_liked'];
    lowLimit = json['low_limit'];
    isFeature = json['is_feature'];
    productsSlug = json['products_slug'];
    productsType = json['products_type'];
    productsMinOrder = json['products_min_order'];
    productsMaxStock = json['products_max_stock'];
    isShowWeb = json['is_show_web'];
    isShowApp = json['is_show_app'];
    isShowAdmin = json['is_show_admin'];
    adminId = json['admin_id'];
    productParentId = json['product_parent_id'];
    barcode = json['barcode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    languageId = json['language_id'];
    productsName = json['products_name'];
    productsDescription = json['products_description'];
    productsUrl = json['products_url'];
    productsViewed = json['products_viewed'];
    productsLeftBanner = json['products_left_banner'];
    productsLeftBannerStartDate = json['products_left_banner_start_date'];
    productsLeftBannerExpireDate = json['products_left_banner_expire_date'];
    productsRightBanner = json['products_right_banner'];
    productsRightBannerStartDate = json['products_right_banner_start_date'];
    productsRightBannerExpireDate = json['products_right_banner_expire_date'];
    manufacturerName = json['manufacturer_name'];
    manufacturerImage = json['manufacturer_image'];
    manufacturersSlug = json['manufacturers_slug'];
    dateAdded = json['date_added'];
    lastModified = json['last_modified'];
    manufacturersImage = json['manufacturers_image'];
    manufacturersUrl = json['manufacturers_url'];
    discountPrice = json['discount_price'];
    currency = json['currency'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    rating = json['rating'];
    totalUserRated = json['total_user_rated'];
    fiveRatio = json['five_ratio'];
    fourRatio = json['four_ratio'];
    threeRatio = json['three_ratio'];
    twoRatio = json['two_ratio'];
    oneRatio = json['one_ratio'];
    // if (json['reviewed_customers'] != null) {
    //   reviewedCustomers = new List<dynamic>();
    //   json['reviewed_customers'].forEach((v) {
    //     reviewedCustomers.add(new dynamic.fromJson(v));
    //   });
    // }
    isLiked = json['isLiked'];
    defaultStock = json['defaultStock'];
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products_to_categories_id'] = this.productsToCategoriesId;
    data['products_id'] = this.productsId;
    data['categories_id'] = this.categoriesId;
    data['products_quantity'] = this.productsQuantity;
    data['products_model'] = this.productsModel;
    data['products_image'] = this.productsImage;
    data['products_video_link'] = this.productsVideoLink;
    data['price_buy'] = this.priceBuy;
    data['products_price'] = this.productsPrice;
    data['products_date_added'] = this.productsDateAdded;
    data['products_last_modified'] = this.productsLastModified;
    data['products_date_available'] = this.productsDateAvailable;
    data['products_weight'] = this.productsWeight;
    data['products_weight_unit'] = this.productsWeightUnit;
    data['products_status'] = this.productsStatus;
    data['is_current'] = this.isCurrent;
    data['products_tax_class_id'] = this.productsTaxClassId;
    data['manufacturers_id'] = this.manufacturersId;
    data['products_ordered'] = this.productsOrdered;
    data['products_liked'] = this.productsLiked;
    data['low_limit'] = this.lowLimit;
    data['is_feature'] = this.isFeature;
    data['products_slug'] = this.productsSlug;
    data['products_type'] = this.productsType;
    data['products_min_order'] = this.productsMinOrder;
    data['products_max_stock'] = this.productsMaxStock;
    data['is_show_web'] = this.isShowWeb;
    data['is_show_app'] = this.isShowApp;
    data['is_show_admin'] = this.isShowAdmin;
    data['admin_id'] = this.adminId;
    data['product_parent_id'] = this.productParentId;
    data['barcode'] = this.barcode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['language_id'] = this.languageId;
    data['products_name'] = this.productsName;
    data['products_description'] = this.productsDescription;
    data['products_url'] = this.productsUrl;
    data['products_viewed'] = this.productsViewed;
    data['products_left_banner'] = this.productsLeftBanner;
    data['products_left_banner_start_date'] = this.productsLeftBannerStartDate;
    data['products_left_banner_expire_date'] =
        this.productsLeftBannerExpireDate;
    data['products_right_banner'] = this.productsRightBanner;
    data['products_right_banner_start_date'] =
        this.productsRightBannerStartDate;
    data['products_right_banner_expire_date'] =
        this.productsRightBannerExpireDate;
    data['manufacturer_name'] = this.manufacturerName;
    data['manufacturer_image'] = this.manufacturerImage;
    data['manufacturers_slug'] = this.manufacturersSlug;
    data['date_added'] = this.dateAdded;
    data['last_modified'] = this.lastModified;
    data['manufacturers_image'] = this.manufacturersImage;
    data['manufacturers_url'] = this.manufacturersUrl;
    data['discount_price'] = this.discountPrice;
    data['currency'] = this.currency;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    data['total_user_rated'] = this.totalUserRated;
    data['five_ratio'] = this.fiveRatio;
    data['four_ratio'] = this.fourRatio;
    data['three_ratio'] = this.threeRatio;
    data['two_ratio'] = this.twoRatio;
    data['one_ratio'] = this.oneRatio;
    if (this.reviewedCustomers != null) {
      data['reviewed_customers'] =
          this.reviewedCustomers.map((v) => v.toJson()).toList();
    }
    data['isLiked'] = this.isLiked;
    data['defaultStock'] = this.defaultStock;
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int categoriesId;
  String categoriesName;
  String categoriesImage;
  String categoriesIcon;
  int parentId;

  Categories(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesIcon,
      this.parentId});

  Categories.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesIcon = json['categories_icon'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_icon'] = this.categoriesIcon;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class Attributes {
  String memory;
  String color;
  String size;
  int id;
  int price;
  String homeImage;
  List<String> images;

  Attributes(
      {this.memory,
      this.color,
      this.size,
      this.id,
      this.price,
      this.homeImage,
      this.images});

  Attributes.fromJson(Map<String, dynamic> json) {
    memory = json['Memory'];
    color = json['color'];
    size = json['size'];
    id = json['id'];
    price = json['price'];
    homeImage = json['home_image'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Memory'] = this.memory;
    data['color'] = this.color;
    data['size'] = this.size;
    data['id'] = this.id;
    data['price'] = this.price;
    data['home_image'] = this.homeImage;
    // if (this.images != null) {
    //   data['images'] = this.images.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
