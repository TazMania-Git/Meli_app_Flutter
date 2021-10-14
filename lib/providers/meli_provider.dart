import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meli_app_flutter/models/seller_result.dart';

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-101401-ae5d3d6af333d99608a48c2c1549ea8f-28610621';
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
    final url = Uri.https(_baseUrl, 'sites/MLA/search', {'seller_id': '$query','nickname':'$query'});
    final response = await http.get(url, headers: {'Authorization': _apiKey});
    final sellerResult = SellerResult.fromJson(response.body);
    // print(response.body);
    print(sellerResult.price);
  }
}
