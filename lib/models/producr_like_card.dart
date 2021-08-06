class ProductLikeCard {
  int response;
  List<ProductLC> data;

  ProductLikeCard({this.response, this.data});

  ProductLikeCard.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    if (json['data'] != null) {
      data = <ProductLC>[];
      json['data'].forEach((v) {
        data.add(new ProductLC.fromJson(v));
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

class ProductLC {
  String productId;
  String categoryId;
  String productName;
  String productPrice;
  String productPriceWithoutVat;
  String productImage;
  String productCurrency;
  String optionalFieldsExist;
  String productOptionalFields;
  String sellPrice;
  String sellPriceWithoutVat;
  bool available;
  String vatAmount;
  String vatPercentage;

  ProductLC(
      {this.productId,
      this.categoryId,
      this.productName,
      this.productPrice,
      this.productPriceWithoutVat,
      this.productImage,
      this.productCurrency,
      this.optionalFieldsExist,
      this.productOptionalFields,
      this.sellPrice,
      this.sellPriceWithoutVat,
      this.available,
      this.vatAmount,
      this.vatPercentage});

  ProductLC.fromJson(Map<String, dynamic> json) {
    productId = json['productId'].toString();
    categoryId = json['categoryId'].toString();
    productName = json['productName'].toString();
    productPrice = json['productPrice'].toString();
    productPriceWithoutVat = json['productPriceWithoutVat'].toString();
    productImage = json['productImage'].toString();
    productCurrency = json['productCurrency'].toString();
    optionalFieldsExist = json['optionalFieldsExist'].toString();
    productOptionalFields = json['productOptionalFields'].toString();
    sellPrice = json['sellPrice'].toString();
    sellPriceWithoutVat = json['sellPriceWithoutVat'].toString();
    available = json['available'];
    vatAmount = "${json['vatAmount']}";
    vatPercentage = json['vatPercentage'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['productId'] = this.productId;
    // data['categoryId'] = this.categoryId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    // data['productPriceWithoutVat'] = this.productPriceWithoutVat;
    data['productImage'] = this.productImage;
    data['productCurrency'] = this.productCurrency;
    // data['optionalFieldsExist'] = this.optionalFieldsExist;
    // data['productOptionalFields'] = this.productOptionalFields;
    // data['sellPrice'] = this.sellPrice;
    // data['sellPriceWithoutVat'] = this.sellPriceWithoutVat;
    // data['available'] = this.available;
    // data['vatAmount'] = this.vatAmount;
    // data['vatPercentage'] = this.vatPercentage;
    return data;
  }
}
