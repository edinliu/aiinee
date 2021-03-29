import 'package:flutter/material.dart';
import './screen/Authed/index.dart';
import 'widgets/FirebaseAuthProvider.dart';
import './screen/Login.dart';

void main() {
  runApp(mainPage);
}

Widget mainPage = MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      // primarySwatch: Colors.pink,
      // primaryColor: Colors.lightBlue[100],
      // accentColor: Colors.cyan[600],
      // bottomNavigationBarTheme:
      //     BottomNavigationBarThemeData(backgroundColor: Colors.purple),
      // fontFamily: 'Georgia',
      // textTheme: TextTheme(
      //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      // ),
      // iconTheme: IconThemeData(color: Colors.black87),
      // primaryIconTheme: IconThemeData(color: Colors.red),
      // backgroundColor: Color.fromRGBO(100, 100, 100, 1),
    ),
    home: Scaffold(
        backgroundColor: Color.fromRGBO(100, 100, 100, 1),
        body: FirebaseAuthProvider(
          errorScreen: Text('errorScreen...'),
          loadingScreen: Text('loadingScreen...'),
          authedScreen: Authed(),
          loginScreen: Login(title: 'Login'),
        )));
