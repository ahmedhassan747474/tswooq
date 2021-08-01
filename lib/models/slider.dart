// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.success,
    this.data,
    this.message,
  });

  String success;
  List<Datum> data;
  String message;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.url,
    this.imageId,
    this.image,
    this.type,
  });

  int id;
  String title;
  String url;
  int imageId;
  String image;
  String type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        imageId: json["image_id"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "image_id": imageId,
        "image": image,
        "type": type,
      };
}
