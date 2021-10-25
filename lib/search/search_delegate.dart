import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:meli_app_flutter/helpers/mobile_pdf_creator.dart';
import 'package:meli_app_flutter/models/result.dart';
import 'package:meli_app_flutter/providers/meli_provider.dart';
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
        backgroundColor: Color.fromRGBO(254, 231, 1, 1),
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
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    if (query.isEmpty) {
      return _emptyData();
    } else {
      final sellerProvider = Provider.of<MeliProvider>(context);
      sellerProvider.getSuggestionByQuery(query);
      late List<Result> resultForPdfCreator;

      return WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: SpeedDial(
            animatedIconTheme: IconThemeData(color: Colors.black87),
            animatedIcon: AnimatedIcons.menu_home,
            openCloseDial: isDialOpen,
            backgroundColor: Colors.yellow,
            overlayColor: Colors.grey,
            overlayOpacity: 0.5,
            spacing: 15,
            spaceBetweenChildren: 15,
            closeManually: true,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.contact_support_outlined),
                  label: 'About',
                  backgroundColor: Colors.blueAccent,
                  onTap: () {
                    isDialOpen.value = false;
                    _mostrarAlerta(context);
                    print('About');
                  }),
              SpeedDialChild(
                  child: Icon(Icons.file_download),
                  label: 'Download PDF',
                  onTap: () {
                    _createPDF(resultForPdfCreator);
                    print('Download PDF');
                  }),
              SpeedDialChild(
                  child: Icon(Icons.update),
                  label: 'Refresh Token',
                  onTap: () {
                    sellerProvider.refreshToken();
                    print('Refresh Token');
                  }),
            ],
          ),
          body: StreamBuilder(
              stream: sellerProvider.suggestionStream,
              builder: (_, AsyncSnapshot<List<Result>> snapshot) {
                if (!snapshot.hasData) return _emptyData();
                final result = snapshot.data!;
                resultForPdfCreator = result;

                return ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (_, int index) {
                      return _ResultSuggestions(result[index]);
                    });
              }),
        ),
      );
    }
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
      trailing: Text('ID: ${result.seller.id}'),
      onTap: () {},
    );
  }
}

Future<void> _createPDF(List<Result> resultMeli) async {
  PdfDocument document = PdfDocument();
  final page = document.pages.add();

  page.graphics.drawString(
    '${resultMeli[0].seller.nickname} - ID ${resultMeli[0].seller.id}',
    PdfStandardFont(
      PdfFontFamily.courier,
      25,
      style: PdfFontStyle.bold,
    ),
    brush: PdfBrushes.red,
  );

  // page.graphics.drawImage(PdfBitmap(await _readImageData('Meli.png')),
  //     Rect.fromLTWH(0, 10, 10, 10));

  PdfGrid grid = PdfGrid();
  grid.style = PdfGridStyle(
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
      cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

  grid.columns.add(count: 3);
  grid.headers.add(1);

  PdfGridRow header = grid.headers[0];
  header.cells[0].value = 'Title';
  header.cells[1].value = 'ID';
  header.cells[2].value = 'Price';
  header.style = PdfGridRowStyle(
    backgroundBrush: PdfBrushes.lightBlue,
    textBrush: PdfBrushes.darkBlue,
  );

  for (int i = 0; i <= resultMeli.length; i++) {
    PdfGridRow row = grid.rows.add();
    row.cells[0].value = resultMeli[i].title;
    row.cells[1].value = resultMeli[i].id;
    row.cells[2].value = '\$ ${resultMeli[i].price}';
    row.style = PdfGridRowStyle();
    // print(
    //     '${resultMeli[i].title} - ${resultMeli[i].id} -\$ ${resultMeli[i].price}');
  }

  // PdfGridRow row = grid.rows.add();
  // row.cells[0].value = '1';
  // row.cells[1].value = 'Arya';
  // row.cells[2].value = '6';

  // row = grid.rows.add();
  // row.cells[0].value = '2';
  // row.cells[1].value = 'John';
  // row.cells[2].value = '9';

  // row = grid.rows.add();
  // row.cells[0].value = '3';
  // row.cells[1].value = 'Tony';
  // row.cells[2].value = '8';

  grid.draw(page: page, bounds: const Rect.fromLTWH(0, 60, 0, 0));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFile(bytes, '${resultMeli[0].seller.nickname}.pdf');
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

void _mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        titleTextStyle: TextStyle(
          color: Color.fromRGBO(31, 56, 123, 1),
          fontFamily: 'Harabara Mais Demo',
          fontSize: 25,
        ),
        contentTextStyle: TextStyle(
          color: Color.fromRGBO(31, 56, 123, 1),
          fontFamily: 'Harabara Mais Demo',
          fontSize: 20,
        ),
        backgroundColor: Color.fromRGBO(254, 231, 1, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Desarrollado por:"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Franco Nicolás Nallino"),
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage('assets/Taz.jpg'),
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("nallinon@gmail.com"),
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Ok",
                style: TextStyle(
                  color: Color.fromRGBO(31, 56, 123, 1),
                  fontSize: 20,
                ),
              ))
        ],
      );
    },
  );
}
