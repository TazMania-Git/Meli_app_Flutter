import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meli_app_flutter/helpers/mobile_pdf_creator.dart';
import 'package:meli_app_flutter/models/result.dart';
import 'package:meli_app_flutter/providers/meli_provider.dart';
import 'package:meli_app_flutter/widgets/card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';

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
      canvasColor: Colors.white,
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
    } else {
      final sellerProvider = Provider.of<MeliProvider>(context);
      sellerProvider.getSuggestionByQuery(query);

      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () {},
          child: Icon(
            Icons.settings,
            color: Colors.black87,
          ),
        ),
        body: StreamBuilder(
            stream: sellerProvider.suggestionStream,
            builder: (_, AsyncSnapshot<List<Result>> snapshot) {
              if (!snapshot.hasData) return _emptyData();
              final result = snapshot.data!;

              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (_, int index) =>
                      _ResultSuggestions(result[index]));
            }),
      );
    }
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
        placeholder: AssetImage('assets/no-image.jpg'),
        image: NetworkImage(result.thumbnail),
        fit: BoxFit.contain,
        width: 50,
      ),
      title: Text(result.title),
      subtitle: Text('Seller: ${result.seller.nickname}'),
      onTap: () {},
    );
  }
}

Future<void> _createPDF() async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawString('Welcome to PDF Succinctly!',
      PdfStandardFont(PdfFontFamily.helvetica, 30));

  page.graphics.drawImage(PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
      Rect.fromLTWH(0, 100, 440, 550));

  PdfGrid grid = PdfGrid();
  grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 30),
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

  grid.columns.add(count: 3);
  grid.headers.add(1);

  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'Roll No';
  header.cells[1].value = 'Name';
  header.cells[2].value = 'Class';

  PdfGridRow row = grid.rows.add();
  row.cells[0].value = '1';
  row.cells[1].value = 'Arya';
  row.cells[2].value = '6';

  row = grid.rows.add();
  row.cells[0].value = '2';
  row.cells[1].value = 'John';
  row.cells[2].value = '9';

  row = grid.rows.add();
  row.cells[0].value = '3';
  row.cells[1].value = 'Tony';
  row.cells[2].value = '8';

  grid.draw(
      page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, 'Output.pdf');
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
