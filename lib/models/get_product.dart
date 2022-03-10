import 'package:tswooq/models/search_product.dart';

class GetProduct {
  String success;
  List<Products> productData;
  String message;
  int totalRecord;

  GetProduct({this.success, this.productData, this.message, this.totalRecord});

  GetProduct.fromJson(Map<String, dynamic> json) {
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
