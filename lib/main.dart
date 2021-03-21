import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String data = '123';

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://asia-northeast1-aiinee.cloudfunctions.net/expressApp/a/helloworld"),
        headers: {"Accept": "application/json"});
    var obj = await json.decode(response.body);

    setState(() {
      data = data + ',' + obj['haha'];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new TextButton(onPressed: getData, child: new Text(data)),
      ),
    );
  }
}
