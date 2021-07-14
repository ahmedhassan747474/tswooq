// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.success,
    this.data,
    this.message,
  });

  String success;
  List<OrderDetails> data;
  String message;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    success: json["success"],
    data: List<OrderDetails>.from(json["data"].map((x) => OrderDetails.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class OrderDetails {
  OrderDetails({
    this.ordersId,
    this.totalTax,
    this.customersId,
    this.customersName,
    this.customersCompany,
    this.customersStreetAddress,
    this.customersSuburb,
    this.customersCity,
    this.customersPostcode,
    this.customersState,
    this.customersCountry,
    this.customersTelephone,
    this.email,
    this.customersAddressFormatId,
    this.deliveryName,
    this.deliveryCompany,
    this.deliveryStreetAddress,
    this.deliverySuburb,
    this.deliveryCity,
    this.deliveryPostcode,
    this.deliveryState,
    this.deliveryCountry,
    this.deliveryAddressFormatId,
    this.billingName,
    this.billingCompany,
    this.billingStreetAddress,
    this.billingSuburb,
    this.billingCity,
    this.billingPostcode,
    this.billingState,
    this.billingCountry,
    this.billingAddressFormatId,
    this.paymentMethod,
    this.ccType,
    this.ccOwner,
    this.ccNumber,
    this.ccExpires,
    this.lastModified,
    this.datePurchased,
    this.ordersDateFinished,
    this.currency,
    this.currencyValue,
    this.orderPrice,
    this.shippingCost,
    this.shippingMethod,
    this.shippingDuration,
    this.orderInformation,
    this.isSeen,
    this.couponAmount,
    this.excludeProductIds,
    this.productCategories,
    this.excludedProductCategories,
    this.freeShipping,
    this.productIds,
    this.orderedSource,
    this.deliveryPhone,
    this.billingPhone,
    this.transactionId,
    this.bankAccountImage,
    this.bankAccountIban,
    this.createdAt,
    this.updatedAt,
    this.deliveryTime,
    this.deliveryLatitude,
    this.deliveryLongitude,
    this.adminDiscount,
    this.adminId,
    this.deliveryboyInfo,
    this.discountType,
    this.amount,
    this.usageLimit,
    this.coupons,
    this.ordersStatusId,
    this.ordersStatus,
    this.customerComments,
    this.adminComments,
    this.data,
  });

  int ordersId;
  int totalTax;
  int customersId;
  String customersName;
  dynamic customersCompany;
  String customersStreetAddress;
  String customersSuburb;
  String customersCity;
  String customersPostcode;
  String customersState;
  String customersCountry;
  String customersTelephone;
  String email;
  dynamic customersAddressFormatId;
  String deliveryName;
  dynamic deliveryCompany;
  String deliveryStreetAddress;
  String deliverySuburb;
  String deliveryCity;
  String deliveryPostcode;
  String deliveryState;
  String deliveryCountry;
  dynamic deliveryAddressFormatId;
  String billingName;
  dynamic billingCompany;
  String billingStreetAddress;
  String billingSuburb;
  String billingCity;
  String billingPostcode;
  String billingState;
  String billingCountry;
  dynamic billingAddressFormatId;
  String paymentMethod;
  dynamic ccType;
  dynamic ccOwner;
  dynamic ccNumber;
  dynamic ccExpires;
  DateTime lastModified;
  DateTime datePurchased;
  dynamic ordersDateFinished;
  String currency;
  String currencyValue;
  int orderPrice;
  int shippingCost;
  dynamic shippingMethod;
  dynamic shippingDuration;
  String orderInformation;
  int isSeen;
  int couponAmount;
  List<dynamic> excludeProductIds;
  List<dynamic> productCategories;
  List<dynamic> excludedProductCategories;
  int freeShipping;
  List<dynamic> productIds;
  int orderedSource;
  String deliveryPhone;
  String billingPhone;
  dynamic transactionId;
  dynamic bankAccountImage;
  dynamic bankAccountIban;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deliveryTime;
  dynamic deliveryLatitude;
  dynamic deliveryLongitude;
  dynamic adminDiscount;
  dynamic adminId;
  List<dynamic> deliveryboyInfo;
  List<dynamic> discountType;
  List<dynamic> amount;
  List<dynamic> usageLimit;
  List<dynamic> coupons;
  int ordersStatusId;
  String ordersStatus;
  dynamic customerComments;
  String adminComments;
  List<OrderProducts> data;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    ordersId: json["orders_id"],
    totalTax: json["total_tax"],
    customersId: json["customers_id"],
    customersName: json["customers_name"],
    customersCompany: json["customers_company"],
    customersStreetAddress: json["customers_street_address"],
    customersSuburb: json["customers_suburb"],
    customersCity: json["customers_city"],
    customersPostcode: json["customers_postcode"],
    customersState: json["customers_state"],
    customersCountry: json["customers_country"],
    customersTelephone: json["customers_telephone"],
    email: json["email"],
    customersAddressFormatId: json["customers_address_format_id"],
    deliveryName: json["delivery_name"],
    deliveryCompany: json["delivery_company"],
    deliveryStreetAddress: json["delivery_street_address"],
    deliverySuburb: json["delivery_suburb"],
    deliveryCity: json["delivery_city"],
    deliveryPostcode: json["delivery_postcode"],
    deliveryState: json["delivery_state"],
    deliveryCountry: json["delivery_country"],
    deliveryAddressFormatId: json["delivery_address_format_id"],
    billingName: json["billing_name"],
    billingCompany: json["billing_company"],
    billingStreetAddress: json["billing_street_address"],
    billingSuburb: json["billing_suburb"],
    billingCity: json["billing_city"],
    billingPostcode: json["billing_postcode"],
    billingState: json["billing_state"],
    billingCountry: json["billing_country"],
    billingAddressFormatId: json["billing_address_format_id"],
    paymentMethod: json["payment_method"],
    ccType: json["cc_type"],
    ccOwner: json["cc_owner"],
    ccNumber: json["cc_number"],
    ccExpires: json["cc_expires"],
    lastModified: DateTime.parse(json["last_modified"]),
    datePurchased: DateTime.parse(json["date_purchased"]),
    ordersDateFinished: json["orders_date_finished"],
    currency: json["currency"],
    currencyValue: json["currency_value"],
    orderPrice: json["order_price"],
    shippingCost: json["shipping_cost"],
    shippingMethod: json["shipping_method"],
    shippingDuration: json["shipping_duration"],
    orderInformation: json["order_information"],
    isSeen: json["is_seen"],
    couponAmount: json["coupon_amount"],
    excludeProductIds: List<dynamic>.from(json["exclude_product_ids"].map((x) => x)),
    productCategories: List<dynamic>.from(json["product_categories"].map((x) => x)),
    excludedProductCategories: List<dynamic>.from(json["excluded_product_categories"].map((x) => x)),
    freeShipping: json["free_shipping"],
    productIds: List<dynamic>.from(json["product_ids"].map((x) => x)),
    orderedSource: json["ordered_source"],
    deliveryPhone: json["delivery_phone"],
    billingPhone: json["billing_phone"],
    transactionId: json["transaction_id"],
    bankAccountImage: json["bank_account_image"],
    bankAccountIban: json["bank_account_iban"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deliveryTime: json["delivery_time"],
    deliveryLatitude: json["delivery_latitude"],
    deliveryLongitude: json["delivery_longitude"],
    adminDiscount: json["admin_discount"],
    adminId: json["admin_id"],
    deliveryboyInfo: List<dynamic>.from(json["deliveryboy_info"].map((x) => x)),
    discountType: List<dynamic>.from(json["discount_type"].map((x) => x)),
    amount: List<dynamic>.from(json["amount"].map((x) => x)),
    usageLimit: List<dynamic>.from(json["usage_limit"].map((x) => x)),
    coupons: List<dynamic>.from(json["coupons"].map((x) => x)),
    ordersStatusId: json["orders_status_id"],
    ordersStatus: json["orders_status"],
    customerComments: json["customer_comments"],
    adminComments: json["admin_comments"],
    data: List<OrderProducts>.from(json["data"].map((x) => OrderProducts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders_id": ordersId,
    "total_tax": totalTax,
    "customers_id": customersId,
    "customers_name": customersName,
    "customers_company": customersCompany,
    "customers_street_address": customersStreetAddress,
    "customers_suburb": customersSuburb,
    "customers_city": customersCity,
    "customers_postcode": customersPostcode,
    "customers_state": customersState,
    "customers_country": customersCountry,
    "customers_telephone": customersTelephone,
    "email": email,
    "customers_address_format_id": customersAddressFormatId,
    "delivery_name": deliveryName,
    "delivery_company": deliveryCompany,
    "delivery_street_address": deliveryStreetAddress,
    "delivery_suburb": deliverySuburb,
    "delivery_city": deliveryCity,
    "delivery_postcode": deliveryPostcode,
    "delivery_state": deliveryState,
    "delivery_country": deliveryCountry,
    "delivery_address_format_id": deliveryAddressFormatId,
    "billing_name": billingName,
    "billing_company": billingCompany,
    "billing_street_address": billingStreetAddress,
    "billing_suburb": billingSuburb,
    "billing_city": billingCity,
    "billing_postcode": billingPostcode,
    "billing_state": billingState,
    "billing_country": billingCountry,
    "billing_address_format_id": billingAddressFormatId,
    "payment_method": paymentMethod,
    "cc_type": ccType,
    "cc_owner": ccOwner,
    "cc_number": ccNumber,
    "cc_expires": ccExpires,
    "last_modified": lastModified.toIso8601String(),
    "date_purchased": datePurchased.toIso8601String(),
    "orders_date_finished": ordersDateFinished,
    "currency": currency,
    "currency_value": currencyValue,
    "order_price": orderPrice,
    "shipping_cost": shippingCost,
    "shipping_method": shippingMethod,
    "shipping_duration": shippingDuration,
    "order_information": orderInformation,
    "is_seen": isSeen,
    "coupon_amount": couponAmount,
    "exclude_product_ids": List<dynamic>.from(excludeProductIds.map((x) => x)),
    "product_categories": List<dynamic>.from(productCategories.map((x) => x)),
    "excluded_product_categories": List<dynamic>.from(excludedProductCategories.map((x) => x)),
    "free_shipping": freeShipping,
    "product_ids": List<dynamic>.from(productIds.map((x) => x)),
    "ordered_source": orderedSource,
    "delivery_phone": deliveryPhone,
    "billing_phone": billingPhone,
    "transaction_id": transactionId,
    "bank_account_image": bankAccountImage,
    "bank_account_iban": bankAccountIban,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "delivery_time": deliveryTime,
    "delivery_latitude": deliveryLatitude,
    "delivery_longitude": deliveryLongitude,
    "admin_discount": adminDiscount,
    "admin_id": adminId,
    "deliveryboy_info": List<dynamic>.from(deliveryboyInfo.map((x) => x)),
    "discount_type": List<dynamic>.from(discountType.map((x) => x)),
    "amount": List<dynamic>.from(amount.map((x) => x)),
    "usage_limit": List<dynamic>.from(usageLimit.map((x) => x)),
    "coupons": List<dynamic>.from(coupons.map((x) => x)),
    "orders_status_id": ordersStatusId,
    "orders_status": ordersStatus,
    "customer_comments": customerComments,
    "admin_comments": adminComments,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderProducts {
  OrderProducts({
    this.ordersProductsId,
    this.ordersId,
    this.productsId,
    this.productsModel,
    this.productsName,
    this.productsPrice,
    this.finalPrice,
    this.productsTax,
    this.productsQuantity,
    this.image,
    this.categories,
    this.attributes,
  });

  int ordersProductsId;
  int ordersId;
  int productsId;
  dynamic productsModel;
  String productsName;
  int productsPrice;
  int finalPrice;
  String productsTax;
  int productsQuantity;
  String image;
  List<Category> categories;
  List<dynamic> attributes;

  factory OrderProducts.fromJson(Map<String, dynamic> json) => OrderProducts(
    ordersProductsId: json["orders_products_id"],
    ordersId: json["orders_id"],
    productsId: json["products_id"],
    productsModel: json["products_model"],
    productsName: json["products_name"],
    productsPrice: json["products_price"],
    finalPrice: json["final_price"],
    productsTax: json["products_tax"],
    productsQuantity: json["products_quantity"],
    image: json["image"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "orders_products_id": ordersProductsId,
    "orders_id": ordersId,
    "products_id": productsId,
    "products_model": productsModel,
    "products_name": productsName,
    "products_price": productsPrice,
    "final_price": finalPrice,
    "products_tax": productsTax,
    "products_quantity": productsQuantity,
    "image": image,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes.map((x) => x)),
  };
}

class Category {
  Category({
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.categoriesIcon,
    this.parentId,
  });

  int categoriesId;
  String categoriesName;
  String categoriesImage;
  String categoriesIcon;
  int parentId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoriesId: json["categories_id"],
    categoriesName: json["categories_name"],
    categoriesImage: json["categories_image"],
    categoriesIcon: json["categories_icon"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "categories_id": categoriesId,
    "categories_name": categoriesName,
    "categories_image": categoriesImage,
    "categories_icon": categoriesIcon,
    "parent_id": parentId,
  };
}
