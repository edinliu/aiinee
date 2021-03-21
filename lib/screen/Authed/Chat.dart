import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
          ),
        ],
      ),
    );
  }
}
