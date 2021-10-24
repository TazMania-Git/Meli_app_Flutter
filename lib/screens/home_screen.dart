import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meli_app_flutter/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(254, 231, 1, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(),
              Image(image: AssetImage('assets/Meli.png')),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "mercado\n  libre",
                  style: TextStyle(
                    wordSpacing: 3,
                    height: 0.8,
                    fontSize: 50,
                    decoration: TextDecoration.none,
                    fontFamily: 'Harabara Mais Demo',
                    color: Color.fromRGBO(31, 56, 123, 1),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  spreadRadius: 4,
                  color: Color.fromRGBO(31, 56, 123, 1).withOpacity(0.2),
                  blurRadius: 7),
            ], shape: BoxShape.circle),
            child: FittedBox(
              child: FloatingActionButton.large(
                onPressed: () => showSearch(
                    context: context, delegate: SearchSellerDelegate()),
                child: Icon(
                  Icons.search_rounded,
                  size: 70,
                  // color: Colors.black87,
                  color: Color.fromRGBO(31, 56, 123, 1),
                ),
                backgroundColor: Colors.yellowAccent,
              ),
            ),
          ),
        ));
  }
}




////OLD THING///////
// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Icon _searchIcon = new Icon(Icons.search);
//   Widget _appBarTitle = new Text('Search Meli seller');
//   final TextEditingController _filter = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title:_appBarTitle,
//         elevation: 0,
//         actions: [
//           IconButton(onPressed: () => _searchPressed(), icon: _searchIcon),
//         ],
//       ),
//       body: SingleChildScrollView(),
//     );
//   }

//   void _searchPressed() {
//     setState(() {
//       if (this._searchIcon.icon == Icons.search) {
//         this._searchIcon = new Icon(Icons.close);
//         this._appBarTitle = new TextField(
//           controller: _filter,
//           decoration: new InputDecoration(
//               prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
//         );
//       } else {
//         this._searchIcon = new Icon(Icons.search);
//         this._appBarTitle = new Text('Search Meli seller');
//       }
//     });
//   }
// }
