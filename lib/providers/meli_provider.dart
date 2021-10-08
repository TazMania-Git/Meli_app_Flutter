import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-100818-559f3dfb7da0c0c3cc32cc2725e434d6-28610621';
  String _baseUrl = 'api.mercadolibre.com';

  MeliProvider() {
    print('MeliProvider inicializado');
    // getWithSellerId(179571326);
    getPersonalData();
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
    print(getJsonData['nickname']);
  }

  getWithSellerId(int query) async {
    final getJsonData = await _getJsonData('sites/MLA/search?seller_id=$query');
    print(getJsonData);

    // final nowPlayingResponse = NowPlayingResponse.fromJson(getJsonData);
    // onDisplayMovies = nowPlayingResponse.results;
  }
}
