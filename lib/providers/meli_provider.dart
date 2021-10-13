import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-101301-7be22b0c0d608f6702d94eb9af332b26-28610621';
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
    print(response.body);
  }
}
