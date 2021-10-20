import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meli_app_flutter/models/models.dart';

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-102001-346ab4ec1af79d2cb52069cd06f3cea0-28610621';
  String _baseUrl = 'api.mercadolibre.com';
  List<Result> resultFromSeller = [];

  MeliProvider() {
    print('MeliProvider inicializado');
    // getWithSellerId('TIENDASMERCADOLIBRE');
    getWithSellerId(179571326);
    // getPersonalData();
  }

  Future<String> _getJsonData(String endPoint, dynamic? query) async {
    final url = Uri.https(_baseUrl, endPoint, {'seller_id': '$query'});
    final response = await http.get(url, headers: {'Authorization': _apiKey});
    return response.body;
  }

  getWithSellerId(dynamic query) async {
    final getJsonData = await _getJsonData('sites/MLA/search', query);
    final sellerResult = SellerResults.fromJson(getJsonData);
    resultFromSeller = sellerResult.sellerItems;

    // print(sellerResult.sellerId);
    // print(sellerResult.nickName);
    // print(sellerResult.sellerItems[0].title);
    // for (int i = 0; i < sellerResult.sellerItems.length; i++) {
    //   print(sellerResult.sellerItems[i].title);
    // }

// #region OLD
    // Map<String, String> requestHeaders = {
    //   'Content-type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': "_apiKey"
    // };

    // getPersonalData() async {
    //   final getJsonData = await _getJsonData('users/me');
    //   print(getJsonData);
    // }

    // final test = convert.json.decode(getJsonData);
    // print(test['results']);
    // print(getJsonData);
    // final url = Uri.https(_baseUrl, 'sites/MLA/search',
    //     {'seller_id': '$query', 'nickname': '$query'});
    // final response = await http.get(url, headers: {'Authorization': _apiKey
    // });
    // final test = convert.json.decode(response.body);
    // print(test['seller']);
    //final sellerResult = SellerResults.fromJson(response.body);
    // print(sellerResult.nickName);

    // final sellerResult = Credits.fromJson(response.body);
    // print(sellerResult);
    //  print(response.body);
// #endregion
  }
}
