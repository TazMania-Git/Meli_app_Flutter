import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meli_app_flutter/models/result.dart';
import 'package:meli_app_flutter/providers/meli_provider.dart';
import 'package:meli_app_flutter/widgets/card_swiper.dart';
import 'package:provider/provider.dart';

class SearchSellerDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none)),
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
    final sellerProvider = Provider.of<MeliProvider>(context);

    if (query.isEmpty) {
      return _emptyData();
    }
    return ListView.builder(
      itemCount: sellerProvider.resultFromSeller.length,
        itemBuilder: (_, int index) =>
            _ResultSuggestions(sellerProvider.resultFromSeller[index]));

    // return CardSwiper(query, sellerProvider.resultFromSeller);
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

class _ResultSuggestions extends StatelessWidget {
  final Result result;

  const _ResultSuggestions(this.result);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('lib/assets/no-image.jpg'),
        image: NetworkImage(result.thumbnail),
        fit: BoxFit.contain,
        width: 50,
      ),
      title: Text(result.title),
      subtitle: Text(''),
      onTap: () {},
    );
  }
}
