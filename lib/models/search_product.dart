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

// class Products {
//   List<Data> data;
//   Links links;
//   Meta meta;
//   bool success;
//   int status;
//
//   Products({this.data, this.links, this.meta, this.success, this.status});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? new Links.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//     success = json['success'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     if (this.links != null) {
//       data['links'] = this.links.toJson();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta.toJson();
//     }
//     data['success'] = this.success;
//     data['status'] = this.status;
//     return data;
//   }
// }

class Products {
  int productsId;
  int productsQuantity;
  int quantityOrdered;
  String productsImage;
  String isLiked;
  String rating;
  String defaultStock;
  String barcode;
  String shopName;
  String productsName;
  String productsDescription;
  List<Images> images;
  List<Attributes> attributes;

  Products(
      {this.productsId,
      this.productsQuantity,
      this.productsImage,
      this.isLiked,
      this.rating,
      this.barcode,
      this.shopName,
      this.productsName,
      this.productsDescription,
      this.images,
      this.attributes});

  Products.fromJson(Map<String, dynamic> json) {
    productsId = json['products_id'];
    productsQuantity = json['products_quantity'];
    productsImage = json['products_image'];
    barcode = json['barcode'];
    shopName = json['shop_name'];
    productsName = json['products_name'];
    productsDescription = json['products_description'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
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
    data['products_image'] = this.productsImage;
    data['barcode'] = this.barcode;
    data['shop_name'] = this.shopName;
    data['products_name'] = this.productsName;
    data['products_description'] = this.productsDescription;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  int stockId;
  String color;
  String memory;
  String price;
  String size;
  int quantity;
  String image;
  String sKU;

  Attributes(
      {this.stockId,
      this.color,
      this.memory,
      this.price,
      this.quantity,
      this.image,
      this.sKU});

  Attributes.fromJson(Map<String, dynamic> json) {
    stockId = json['stock_id'];
    color = json['color'];
    memory = json['Memory'];
    price = json['price'] ?? "0";
    quantity = json['quantity'];
    image = json['image'];
    sKU = json['SKU'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock_id'] = this.stockId;
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
  Null createdAt;
  Null updatedAt;
  Pivot pivot;

  Images(
      {this.id,
      this.imageId,
      this.imageType,
      this.height,
      this.width,
      this.path,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['image_id'];
    imageType = json['image_type'];
    height = json['height'];
    width = json['width'];
    path = json['path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
