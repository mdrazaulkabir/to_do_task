import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final String? id;
  final String? productName;
  final int? productCode;
  final String? img;
  final int? qty;
  final int? unitPrice;
  final int? totalPrice;

  ProductModel({
    this.id,
    this.productName,
    this.productCode,
    this.img,
    this.qty,
    this.unitPrice,
    this.totalPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["_id"],
    productName: json["ProductName"],
    productCode: json["ProductCode"],
    img: json["Img"],
    qty: json["Qty"],
    unitPrice: json["UnitPrice"],
    totalPrice: json["TotalPrice"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ProductName": productName,
    "ProductCode": productCode,
    "Img": img,
    "Qty": qty,
    "UnitPrice": unitPrice,
    "TotalPrice": totalPrice,
  };
}
