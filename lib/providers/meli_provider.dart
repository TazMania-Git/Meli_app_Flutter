import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meli_app_flutter/models/seller_result.dart';
// import 'package:meli_app_flutter/models/seller_result_test.dart';

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-101811-7bbca2ce46634f3200f491ff3b1861ec-28610621';
  String _baseUrl = 'api.mercadolibre.com';

  MeliProvider() {
    print('MeliProvider inicializado');
    // getWithSellerId('TIENDASMERCADOLIBRE');
    getWithSellerId(179571326);
    //getPersonalData();
  }

  // Map<String, String> requestHeaders = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  //   'Authorization': "_apiKey"
  // };

  Future<String> _getJsonData(String endPoint) async {
    final url = Uri.https(_baseUrl, endPoint);
    final response = await http.get(url, headers: {'Authorization': _apiKey});
    return response.body;
  }

  getPersonalData() async {
    final getJsonData = await _getJsonData('users/me');
    print(getJsonData);
  }

  getWithSellerId(dynamic query) async {
    final url = Uri.https(_baseUrl, 'sites/MLA/search',
        {'seller_id': '$query', 'nickname': '$query'});
    final response = await http.get(url, headers: {'Authorization': _apiKey});
    // final test = convert.json.decode(response.body);
    // print(test['seller']);
    // final sellerResult = SellerResults.fromJson(response.body);
    // print(sellerResult.nickName);

    final sellerResult = Credits.fromJson(response.body);
    print(sellerResult.seller.nickname);
    // print(response.body);
  }
}
