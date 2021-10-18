import 'dart:convert';

class SellerResults {
  final String sellerId;
  final String nickName;
  final List<dynamic> sellerItems;

  SellerResults(
      {required this.sellerId,
      required this.nickName,
      required this.sellerItems});

  factory SellerResults.fromJson(String str) =>
      SellerResults.fromMap(json.decode(str));

  factory SellerResults.fromMap(Map<String, dynamic> json) => SellerResults(
        sellerId: json['id'].toString(),
        nickName: json['nickname'],
        sellerItems: json['results'],
      );
}
