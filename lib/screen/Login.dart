import 'package:flutter/material.dart';
import '../widgets/FirebaseEmailAndPassword.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(child: FirebaseEmailAndPassword());
  }
}
