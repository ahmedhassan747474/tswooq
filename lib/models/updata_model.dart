class Update {
  String android;
  String ios;
  int num;

  Update({this.android, this.ios, this.num});

  Update.fromJson(Map<String, dynamic> json) {
    android = json['android'];
    ios = json['ios'];
    num = json['num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['android'] = this.android;
    data['ios'] = this.ios;
    data['num'] = this.num;
    return data;
  }
}
