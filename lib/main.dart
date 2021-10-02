import 'package:flutter/material.dart';
import 'package:meli_app_flutter/screens/details_screen.dart';
import 'package:meli_app_flutter/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailScreen(),
      },
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
        color: Colors.indigo,
      )),
      // theme: ThemeData(
      //     primarySwatch: Colors.yellow,
      //     canvasColor: Colors.yellow,
      //     appBarTheme: AppBarTheme(color: Colors.yellow)),
    );
  }
}
