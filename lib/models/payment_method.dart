class PaymentMethodModel {
  String success;
  List<PaymentMethod> data;
  String message;

  PaymentMethodModel({this.success, this.data, this.message});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PaymentMethod>[];
      json['data'].forEach((v) {
        data.add(new PaymentMethod.fromJson(v));
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

class PaymentMethod {
  String environment;
  String name;
  String publicKey;
  int active;
  String paymentMethod;
  String paymentCurrency;
  String rAZORPAYKEY;
  String rAZORPAYSECRET;

  PaymentMethod(
      {this.environment,
      this.name,
      this.publicKey,
      this.active,
      this.paymentMethod,
      this.paymentCurrency,
      this.rAZORPAYKEY,
      this.rAZORPAYSECRET});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    environment = json['environment'];
    name = json['name'];
    publicKey = json['public_key'];
    active = json['active'];
    paymentMethod = json['payment_method'];
    paymentCurrency = json['payment_currency'];
    rAZORPAYKEY = json['RAZORPAY_KEY'];
    rAZORPAYSECRET = json['RAZORPAY_SECRET'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['environment'] = this.environment;
    data['name'] = this.name;
    data['public_key'] = this.publicKey;
    data['active'] = this.active;
    data['payment_method'] = this.paymentMethod;
    data['payment_currency'] = this.paymentCurrency;
    data['RAZORPAY_KEY'] = this.rAZORPAYKEY;
    data['RAZORPAY_SECRET'] = this.rAZORPAYSECRET;
    return data;
  }
}
