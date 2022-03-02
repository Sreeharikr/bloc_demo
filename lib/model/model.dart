// To parse this JSON data, do
//
//     final modelClass = modelClassFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelClass modelClassFromMap(String str) =>
    ModelClass.fromMap(json.decode(str));

String modelClassToMap(ModelClass data) => json.encode(data.toMap());

class ModelClass {
  ModelClass({
    required this.result,
  });

  final List<Result> result;

  factory ModelClass.fromMap(Map<String, dynamic> json) => ModelClass(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.productId,
    required this.productKey,
    required this.productName,
    required this.description,
    required this.currency,
    required this.qty,
    required this.price,
    required this.actualPrice,
    required this.currencysymbol,
    required this.totalCount,
    required this.productImage,
    required this.catId,
    required this.available,
    required this.featured,
    required this.offer,
    required this.inCart,
    required this.availabilityStatus,
  });

  final int productId;
  final String productKey;
  final String productName;
  final String description;
  final dynamic currency;
  final String qty;
  final double price;
  final double actualPrice;
  final String currencysymbol;
  final int totalCount;
  final String productImage;
  final int catId;
  final bool available;
  final bool featured;
  final double offer;
  final bool inCart;
  final String availabilityStatus;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        productId: json["ProductID"],
        productKey: json["ProductKey"],
        productName: json["ProductName"],
        description: json["Description"],
        currency: json["Currency"],
        qty: json["Qty"],
        price: json["Price"].toDouble(),
        actualPrice: json["ActualPrice"],
        currencysymbol: json["Currencysymbol"],
        totalCount: json["TotalCount"],
        productImage: json["ProductImage"],
        catId: json["CatID"],
        available: json["Available"],
        featured: json["Featured"],
        offer: json["Offer"],
        inCart: json["InCart"],
        availabilityStatus: json["AvailabilityStatus"],
      );

  Map<String, dynamic> toMap() => {
        "ProductID": productId,
        "ProductKey": productKey,
        "ProductName": productName,
        "Description": description,
        "Currency": currency,
        "Qty": qty,
        "Price": price,
        "ActualPrice": actualPrice,
        "Currencysymbol": currencysymbol,
        "TotalCount": totalCount,
        "ProductImage": productImage,
        "CatID": catId,
        "Available": available,
        "Featured": featured,
        "Offer": offer,
        "InCart": inCart,
        "AvailabilityStatus": availabilityStatus,
      };
}
