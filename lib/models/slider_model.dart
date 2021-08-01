class SlidersModel {
  String success;
  List<Sliders> data;
  String message;

  SlidersModel({this.success, this.data, this.message});

  SlidersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Sliders>[];
      json['data'].forEach((v) {
        data.add(new Sliders.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Sliders {
  int id;
  String title;
  String url;
  String image;
  String type;
  String path;

  Sliders({this.id, this.title, this.url, this.image, this.type, this.path});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    image = json['image'];
    type = json['type'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['image'] = this.image;
    data['type'] = this.type;
    data['path'] = this.path;
    return data;
  }
}
