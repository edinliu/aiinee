import 'package:flutter/material.dart';
import './screen/Authed/index.dart';
import 'widgets/FirebaseAuthProvider.dart';
import './screen/Login.dart';

void main() {
  runApp(mainPage);
}

Widget mainPage = MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.black87),
      primaryIconTheme: IconThemeData(color: Colors.red),
      backgroundColor: Color.fromRGBO(100, 100, 100, 1),
    ),
    home: Scaffold(
        backgroundColor: Color.fromRGBO(100, 100, 100, 1),
        body: FirebaseAuthProvider(
          errorScreen: Text('errorScreen...'),
          loadingScreen: Text('loadingScreen...'),
          authedScreen: Authed(),
          loginScreen: Login(title: 'Login'),
        )));
