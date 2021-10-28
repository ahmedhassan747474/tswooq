import 'package:tswooq/models/search_product.dart';

class GroupModel {
  List<Group> data;

  GroupModel({this.data});

  GroupModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] == null) data = new List<Group>();
    if (json['data'] != null) {
      data = new List<Group>();
      json['data'].forEach((v) {
        data.add(new Group.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Group {
  int id;
  String vendorId;
  String nameEn;
  String nameAr;
  String slug;
  String avatar;
  String type;
  String content;
  int status;
  String createdAt;
  String updatedAt;
  List<Products> products;

  Group(
      {this.id,
      this.vendorId,
      this.nameEn,
      this.nameAr,
      this.slug,
      this.avatar,
      this.type,
      this.content,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.products});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorId = "${json['vendor_id']}";
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    slug = json['slug'];
    avatar = json['avatar'];
    type = json['type'];
    content = json['content'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] == null) products = [];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vendor_id'] = this.vendorId;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['slug'] = this.slug;
    data['avatar'] = this.avatar;
    data['type'] = this.type;
    data['content'] = this.content;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
