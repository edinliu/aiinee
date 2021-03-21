import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider extends StatefulWidget {
  FirebaseAuthProvider(
      {Key key,
      this.errorScreen,
      this.loadingScreen,
      this.authedScreen,
      this.loginScreen})
      : super(key: key);
  final Widget errorScreen;
  final Widget loadingScreen;
  final Widget authedScreen;
  final Widget loginScreen;
  @override
  _FirebaseAuthProviderState createState() => _FirebaseAuthProviderState();
}

class _FirebaseAuthProviderState extends State<FirebaseAuthProvider> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _authed = false;
  bool _error = false;
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      FirebaseAuth.instance.authStateChanges().listen((User user) {
        if (user == null) {
          setState(() {
            _authed = false;
          });
          print('User is currently signed out!');
        } else {
          setState(() {
            _authed = true;
          });
          print('User is signed in!');
        }
      });
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return widget.errorScreen;
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return widget.loadingScreen;
    }
    if (_authed)
      return widget.authedScreen;
    else
      return widget.loginScreen;
  }
}
