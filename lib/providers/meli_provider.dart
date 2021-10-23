import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meli_app_flutter/helpers/debouncer.dart';
import 'package:meli_app_flutter/models/models.dart';
import 'package:meli_app_flutter/models/token.dart';

class MeliProvider extends ChangeNotifier {
// String _apiKey =
//       'Bearer APP_USR-8246960858213510-102321-402eb1e526c7a245b8a490b666ac01ba-28610621';
  String _baseUrl = 'api.mercadolibre.com';
  List<Result> resultFromSeller = [];
  late Token token;
  String _apiKey = '';

  final debouncer = Debouncer(duration: Duration(milliseconds: 500));
  final StreamController<List<Result>> _suggestionsStreamController =
      new StreamController.broadcast();
  Stream<List<Result>> get suggestionStream =>
      this._suggestionsStreamController.stream;

  MeliProvider() {
    print('MeliProvider inicializado');
    // getWithSellerId('TIENDASMERCADOLIBRE');
    // getWithSellerId(179571326);
    // getPersonalData();
  }

  Future<String> _getJsonData(String endPoint, dynamic query) async {
    final url = Uri.https(
        _baseUrl, endPoint, {'seller_id': '$query', 'nickname': '$query'});
    final response = await http.get(url, headers: {'Authorization': _apiKey});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return 'Request failed with status: ${response.statusCode}. Maybe if you refresh the token?';
    }
  }

  Future<List<Result>> getWithSellerId(dynamic query) async {
    final getJsonData = await _getJsonData('sites/MLA/search', query);
    final sellerResult = SellerResults.fromJson(getJsonData);
    resultFromSeller = sellerResult.sellerItems;

    print(sellerResult.sellerId);
    print(sellerResult.nickName);
    return sellerResult.sellerItems;

// #region OLD stuff
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
    // print(test['results'])
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
// #endregion  }
  }

  void getSuggestionByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      print('tenemos valor a buscar : $value');
      final results = await this.getWithSellerId(value);
      this._suggestionsStreamController.add(results);
    };
    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

  void refreshToken() async {
    final url = Uri.https(_baseUrl, 'oauth/token');

    var response = await http.post(url,
        body: json.encode({
          "grant_type": "refresh_token",
          "client_id": "8246960858213510",
          "client_secret": "qvbaS2WelbdFCnLffNwkCbh7lZEeAZys",
          "refresh_token": "TG-615e574e7471db0007010e00-28610621"
        }),
        headers: {"Accept": "application/json"});

    token = Token.fromJson(response.body);
    _apiKey = token.tokenType + '' + token.accessToken;
    print(response.body);
    print(_apiKey);
  }
}
