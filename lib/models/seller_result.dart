import 'dart:convert';

import 'package:meli_app_flutter/models/result.dart';

class SellerResults {
  final String sellerId;
  final String nickName;
  final List<Result> sellerItems;
  // final List<dynamic> sellerItems;

  SellerResults(
      {required this.sellerId,
      required this.nickName,
      required this.sellerItems});

  factory SellerResults.fromJson(String str) =>
      SellerResults.fromMap(json.decode(str));

  factory SellerResults.fromMap(Map<String, dynamic> json) => SellerResults(
        sellerId: json['seller']['id'].toString(),
        nickName: json['seller']['nickname'].toString(),
        sellerItems:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        // sellerItems: json['results'],
      );
}
