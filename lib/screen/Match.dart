import 'package:flutter/material.dart';

class Match extends StatefulWidget {
  Match({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            widget.title,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: _incrementCounter,
            child: Text(
              "Flat Button",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
