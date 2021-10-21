import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:meli_app_flutter/helpers/debouncer.dart';
import 'package:meli_app_flutter/models/models.dart';

class MeliProvider extends ChangeNotifier {
  String _apiKey =
      'Bearer APP_USR-8246960858213510-102111-58aec4ceb95631616394ce6755c33cf9-28610621';
  String _baseUrl = 'api.mercadolibre.com';
  List<Result> resultFromSeller = [];

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
    return response.body;
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
}
