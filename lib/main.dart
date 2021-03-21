import 'helpers/fetchApi.dart';
import 'package:flutter/material.dart';

void main() {
  setBaseUrl();
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  String data = 'This is button';

  getData() async {
    var obj = await fetchApi("a/helloworld");
    setState(() {
      data = data + ',' + obj['haha'];
    });
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
