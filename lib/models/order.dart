import 'package:tswooq/models/search_product.dart';

class OrderModel {
  List<OrderDetails> data;
  bool success;
  int status;

  OrderModel({this.data, this.success, this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<OrderDetails>();
      json['data'].forEach((v) {
        data.add(new OrderDetails.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class OrderDetails {
  int ordersId;
  int userId;
  String totalTax;
  String deliveryName;
  String deliveryStreetAddress;
  String deliveryCity;
  String paymentMethod;
  String currency;
  String orderPrice;
  String shippingCost;
  String ordersStatus;
  String customerComments;
  String adminComments;
  List<Products> products;

  OrderDetails(
      {this.ordersId,
      this.userId,
      this.totalTax,
      this.deliveryName,
      this.deliveryStreetAddress,
      this.deliveryCity,
      this.paymentMethod,
      this.currency,
      this.orderPrice,
      this.shippingCost,
      this.ordersStatus,
      this.customerComments,
      this.adminComments,
      this.products});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    userId = json['user_id'];
    totalTax = json['total_tax'];
    deliveryName = json['delivery_name'];
    deliveryStreetAddress = json['delivery_street_address'];
    deliveryCity = json['delivery_city'];
    paymentMethod = json['payment_method'];
    currency = json['currency'];
    orderPrice = json['order_price'];
    shippingCost = json['shipping_cost'];
    ordersStatus = json['orders_status'];
    customerComments = json['customer_comments'];
    adminComments = json['admin_comments'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['user_id'] = this.userId;
    data['total_tax'] = this.totalTax;
    data['delivery_name'] = this.deliveryName;
    data['delivery_street_address'] = this.deliveryStreetAddress;
    data['delivery_city'] = this.deliveryCity;
    data['payment_method'] = this.paymentMethod;
    data['currency'] = this.currency;
    data['order_price'] = this.orderPrice;
    data['shipping_cost'] = this.shippingCost;
    data['orders_status'] = this.ordersStatus;
    data['customer_comments'] = this.customerComments;
    data['admin_comments'] = this.adminComments;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
