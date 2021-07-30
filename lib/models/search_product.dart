class SearchProduct {
  String success;
  List<Products> productData;
  String message;
  int totalRecord;

  SearchProduct(
      {this.success, this.productData, this.message, this.totalRecord});

  SearchProduct.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['product_data'] != null) {
      productData = new List<Products>();
      json['product_data'].forEach((v) {
        productData.add(new Products.fromJson(v));
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

class Products {
  int productsId;

  int productsQuantity;
  String productsModel;
  String productsImage;
  String productsVideoLink;

  int productsPrice;

  String productsWeight;
  String productsWeightUnit;
  int productsStatus;
  int isCurrent;

  int productsLiked;
  int lowLimit;
  int isFeature;
  String productsSlug;
  int productsType;
  int productsMinOrder;
  String productsMaxStock;

  String barcode;

  int id;
  String productsName;
  String productsDescription;

  String discountPrice;
  String currency;
  List<Categories> categories;
  String rating;
  List<dynamic> reviewedCustomers;
  String isLiked;
  int defaultStock;
  List<Attributes> attributes;

  Products(
      {this.productsId,
      this.productsQuantity,
      this.productsModel,
      this.productsImage,
      this.productsVideoLink,
      this.productsPrice,
      this.productsWeight,
      this.productsWeightUnit,
      this.productsStatus,
      this.isCurrent,
      this.productsLiked,
      this.lowLimit,
      this.isFeature,
      this.productsSlug,
      this.productsType,
      this.productsMinOrder,
      this.productsMaxStock,
      this.barcode,
      this.id,
      this.productsName,
      this.productsDescription,
      this.discountPrice,
      this.currency,
      this.categories,
      this.rating,
      this.reviewedCustomers,
      this.isLiked,
      this.defaultStock,
      this.attributes});

  Products.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];

    productsQuantity = json['products_quantity'];
    productsModel = json['products_model'];
    productsImage = json['products_image'];
    productsVideoLink = json['products_video_link'];

    productsPrice = json['products_price'];

    productsWeight = json['products_weight'];
    productsWeightUnit = json['products_weight_unit'];
    productsStatus = json['products_status'];
    isCurrent = json['is_current'];

    productsLiked = json['products_liked'];
    lowLimit = json['low_limit'];
    isFeature = json['is_feature'];
    productsSlug = json['products_slug'];
    productsType = json['products_type'];
    productsMinOrder = json['products_min_order'];
    productsMaxStock = json['products_max_stock'];

    barcode = json['barcode'];

    id = json['id'];
    productsName = json['products_name'];
    productsDescription = json['products_description'];

    discountPrice = json['discount_price'];
    currency = json['currency'];

    rating = json['rating'];

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

    data['products_id'] = this.productsId;

    data['products_quantity'] = this.productsQuantity;
    data['products_model'] = this.productsModel;
    data['products_image'] = this.productsImage;
    data['products_video_link'] = this.productsVideoLink;

    data['products_price'] = this.productsPrice;

    data['products_weight'] = this.productsWeight;
    data['products_weight_unit'] = this.productsWeightUnit;
    data['products_status'] = this.productsStatus;
    data['is_current'] = this.isCurrent;

    data['products_liked'] = this.productsLiked;
    data['low_limit'] = this.lowLimit;
    data['is_feature'] = this.isFeature;
    data['products_slug'] = this.productsSlug;
    data['products_type'] = this.productsType;
    data['products_min_order'] = this.productsMinOrder;
    data['products_max_stock'] = this.productsMaxStock;

    data['barcode'] = this.barcode;

    data['id'] = this.id;

    data['products_name'] = this.productsName;
    data['products_description'] = this.productsDescription;

    data['discount_price'] = this.discountPrice;
    data['currency'] = this.currency;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;

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

class Images {
  int id;
  int productsId;
  String image;
  String htmlcontent;
  int sortOrder;
  String productsOptionsValuesId;

  Images(
      {this.id,
      this.productsId,
      this.image,
      this.htmlcontent,
      this.sortOrder,
      this.productsOptionsValuesId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productsId = json['products_id'];
    image = json['image'];
    htmlcontent = json['htmlcontent'];
    sortOrder = json['sort_order'];
    productsOptionsValuesId = json['products_options_values_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['products_id'] = this.productsId;
    data['image'] = this.image;
    data['htmlcontent'] = this.htmlcontent;
    data['sort_order'] = this.sortOrder;
    data['products_options_values_id'] = this.productsOptionsValuesId;
    return data;
  }
}

class Attributes {
  String memory;
  String color;
  String size;
  int id;
  String price;
  String homeImage;
  List<Images> images;

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
    price = json['price'].toString() ?? "";
    homeImage = json['home_image'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
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
