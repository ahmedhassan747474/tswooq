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
  String productsQuantity;
  int quantityOrdered;
  String productsImage;
  String barcode;
  String discountPrice;
  String rating;
  int productsLiked;
  String shopName;
  String productsName;
  String productsDescription;
  List<Images> images;
  List<Attributes> attributes;

  Products(
      {this.productsId,
      this.productsQuantity,
      this.productsImage,
      this.barcode,
      this.discountPrice,
      this.rating,
      this.productsLiked,
      this.shopName,
      this.productsName,
      this.productsDescription,
      this.images,
      this.attributes});

  Products.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    productsQuantity = json['products_quantity'].toString();
    productsImage = json['products_image'];
    barcode = json['barcode'];
    discountPrice = json['discount_price'];
    rating = json['rating'];
    productsLiked = json['products_liked'];
    shopName = json['shop_name'];
    productsName = json['products_name'];
    productsDescription = json['products_description'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    attributes = []; //todo
    if (json['attributes'] != null) {
      // attributes = [];
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['products_id'] = this.productsId;
    // data['products_quantity'] = this.productsQuantity;
    // data['products_image'] = this.productsImage;
    // data['barcode'] = this.barcode;
    // data['shop_name'] = this.shopName;
    // data['products_name'] = this.productsName;
    // data['products_description'] = this.productsDescription;
    // if (this.images != null) {
    //   data['images'] = this.images.map((v) => v.toJson()).toList();
    // }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int id;
  String color;
  String memory;
  String price;
  String size;
  int quantity;
  String image;
  String sKU;

  Attributes(
      {this.id,
      this.color,
      this.memory,
      this.price,
      this.quantity,
      this.image,
      this.sKU});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['stock_id'];
    color = json['color'];
    memory = json['Memory'];
    price = json['price'].toString() ?? "0";
    quantity = json['quantity'];
    image = json['image'];
    sKU = json['SKU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock_id'] = this.id;
    data['color'] = this.color;
    data['Memory'] = this.memory;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['SKU'] = this.sKU;
    return data;
  }
}

class Images {
  int id;
  int imageId;
  String imageType;
  int height;
  int width;
  String path;

  Pivot pivot;

  Images(
      {this.id,
      this.imageId,
      this.imageType,
      this.height,
      this.width,
      this.path,
      this.pivot});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
    imageType = json['image_type'];
    height = json['height'];
    width = json['width'];
    path = json['path'];

    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_id'] = this.imageId;
    data['image_type'] = this.imageType;
    data['height'] = this.height;
    data['width'] = this.width;
    data['path'] = this.path;

    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int productsId;
  String image;

  Pivot({this.productsId, this.image});

  Pivot.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['products_id'] = this.productsId;
    data['image'] = this.image;
    return data;
  }
}
