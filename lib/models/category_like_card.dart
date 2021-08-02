class CategoriesLikeCard {
  String success;
  Categories categories;
  String message;

  CategoriesLikeCard({this.success, this.categories, this.message});

  CategoriesLikeCard.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.categories != null) {
      data['categories'] = this.categories.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Categories {
  int response;
  List<CategoriesData> data;

  Categories({this.response, this.data});

  Categories.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['data'] != null) {
      data = <CategoriesData>[];
      json['data'].forEach((v) {
        data.add(new CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  String id;
  String categoryParentId;
  String categoryName;
  String amazonImage;
  List<Childs> childs;

  CategoriesData(
      {this.id,
      this.categoryParentId,
      this.categoryName,
      this.amazonImage,
      this.childs});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryParentId = json['categoryParentId'];
    categoryName = json['categoryName'];
    amazonImage = json['amazonImage'];
    if (json['childs'] != null) {
      childs = new List<Childs>();
      json['childs'].forEach((v) {
        childs.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryParentId'] = this.categoryParentId;
    data['categoryName'] = this.categoryName;
    data['amazonImage'] = this.amazonImage;
    if (this.childs != null) {
      data['childs'] = this.childs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  String id;
  String categoryParentId;
  String categoryName;
  String amazonImage;
  List<Childs> childs;

  Childs(
      {this.id,
      this.categoryParentId,
      this.categoryName,
      this.amazonImage,
      this.childs});

  Childs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryParentId = json['categoryParentId'];
    categoryName = json['categoryName'];
    amazonImage = json['amazonImage'];
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryParentId'] = this.categoryParentId;
    data['categoryName'] = this.categoryName;
    data['amazonImage'] = this.amazonImage;
    // if (this.childs != null) {
    //   data['childs'] = this.childs.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
