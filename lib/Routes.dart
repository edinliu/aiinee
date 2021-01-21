import 'package:flutter/material.dart';
import './screen/Match.dart';
import './screen/Profile.dart';

class Routes extends StatefulWidget {
  Routes({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Match(title: 'Match'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Profile(title: 'Profile'),
      },
    );
  }
}
