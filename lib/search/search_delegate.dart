import 'package:flutter/material.dart';

class SearchSellerDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      canvasColor: Colors.yellow,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData.fallback(),
      ),
    );
    // return super.appBarTheme(context).copyWith(
    //       backgroundColor: Colors.yellow,
    //       appBarTheme:
    //     );
  }

  @override
  String? get searchFieldLabel => 'Buscar seller';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyData();
    }
    return Container();
  }

  Widget _emptyData() {
    return Container(
      child: Center(
          child: Icon(
        Icons.sell_rounded,
        color: Colors.black38,
        size: 130,
      )),
    );
  }
}
