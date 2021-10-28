class VendorsModel {
  List<Vendor> data;

  VendorsModel({this.data});

  VendorsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Vendor>();
      json['data'].forEach((v) {
        data.add(new Vendor.fromJson(v));
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

class Vendor {
  int id;
  String name;

  String imagePath;

  Vendor({this.id, this.name, this.imagePath});

  Vendor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;

    data['image_path'] = this.imagePath;
    return data;
  }
}
