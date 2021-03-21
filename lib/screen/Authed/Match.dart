import 'package:flutter/material.dart';

class Match extends StatefulWidget {
  Match({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MatchState createState() => _MatchState();
}

aa() async {
  print('Response body:');
}

class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.title,
              ),
              TextButton(onPressed: aa, child: Text('fuck'))
            ],
          ),
        ));
  }
}
