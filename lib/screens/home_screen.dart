import 'package:flutter/material.dart';
import 'package:meli_app_flutter/search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: FloatingActionButton.large(
            onPressed: () =>
                showSearch(context: context, delegate: SearchSellerDelegate()),
            child: Icon(
              Icons.search_rounded,
              size: 70,
              color: Colors.black87,
            ),
            backgroundColor: Colors.yellowAccent,
          )),
          Divider(),
          Text(
            "mercado libre",
            style: TextStyle(
                fontFamily: 'Harabara Mais Demo',
                color: Color.fromRGBO(31, 56, 123, 1)
                ),
          ),
        ],
      ),
    );
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
