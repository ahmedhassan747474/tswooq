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
    if (json['data'] != null) {
      productData = new List<Products>();
      json['data'].forEach((v) {
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
  int quantityOrdered;
  String productsImage;
  String productsPrice;
  int productsLiked;
  String barcode;
  int id;
  String productsName;
  String productsDescription;
  String discountPrice;
  String rating;
  String path;
  String isLiked;
  int defaultStock;
  List<Attributes> attributes;

  Products(
      {this.productsId,
      this.path,
      this.quantityOrdered,
      this.productsImage,
      this.productsPrice,
      this.productsLiked,
      this.barcode,
      this.id,
      this.productsName,
      this.productsDescription,
      this.discountPrice,
      this.rating,
      this.isLiked,
      this.defaultStock,
      this.attributes});

  Products.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    path = json['path'];
    quantityOrdered = json['quantity_ordered'];
    // productsQuantity = json['products_quantity'];
    productsImage = json['products_image'];
    productsPrice = json['products_price'] ?? "0";
    productsLiked = json['products_liked'];
    barcode = json['barcode'];
    id = json['id'];
    productsName = json['products_name'] ?? "";
    productsDescription = json['products_description'];
    discountPrice = json['discount_price'];
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
    data['products_image'] = this.productsImage;
    data['products_price'] = this.productsPrice;
    data['products_liked'] = this.productsLiked;
    data['barcode'] = this.barcode;
    data['id'] = this.id;
    data['products_name'] = this.productsName;
    data['products_description'] = this.productsDescription;
    data['discount_price'] = this.discountPrice;
    data['rating'] = this.rating;
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
    price = json['price'] == null ? "" : json['price'].toString() ?? "";
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
