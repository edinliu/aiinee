import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseEmailAndPassword extends StatefulWidget {
  FirebaseEmailAndPassword({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FirebaseEmailAndPasswordState createState() =>
      _FirebaseEmailAndPasswordState();
}

class _FirebaseEmailAndPasswordState extends State<FirebaseEmailAndPassword> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  bool isPassword = true;
  String errorMsg = '';
  bool _isCreateAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(100, 100, 100, 1),
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            _emailPasswordWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            _submitButton(),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password ?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _createAccountLabel(),
                    ),
                  ],
                ))));
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () => _isCreateAccount ? createUser() : signIn(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF234452), Color(0xFFba6c91)])),
        child: Text(
          _isCreateAccount ? 'Create Account' : 'Sign In',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _entryEmail(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              // ignore: missing_return
              validator: (String value) {
                if (value.isEmpty ||
                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
              onSaved: (input) => _email = input,
              // obscureText: isPassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter your E-mail',
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryPassword(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              // ignore: missing_return
              validator: (input) {
                if (input.isEmpty) {
                  return 'Enter a valid password';
                }
              },
              onSaved: (input) => _password = input,
              obscureText: isPassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                        print(isPassword);
                      });
                    },
                  ),
                  hintText: 'Enter your password',
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isCreateAccount = !_isCreateAccount;
              });
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: Color(0xFFba6c91),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryEmail("Email "),
        _entryPassword("Password"),
      ],
    );
  }

  void signIn() async {
    print('email and password signIn');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email.trim(), password: _password.trim());
      } catch (error) {
        var errorCode = error.code;
        var errorMessage = error.message;
        switch (errorCode) {
          case "ERROR_WRONG_PASSWORD":
          case "ERROR_INVALID_EMAIL":
            {
              errorMessage = "Wrong password or Email.";
              break;
            }
          case "ERROR_NETWORK_REQUEST_FAILED":
            {
              errorMessage = "Check your internet connection.";
              break;
            }
          case "ERROR_USER_NOT_FOUND":
          case "ERROR_USER_DISABLED":
            {
              errorMessage = "Account not found or disabled";
              break;
            }
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'FirebaseEmailAndPassword Error : ' + errorMessage,
            ),
          ),
        );
        print(error);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'FirebaseEmailAndPassword Error :Empty fields',
          ),
        ),
      );
    }
  }

  void createUser() async {
    print('email and password signIn');
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } catch (e) {
        print(e);
      }
    }
  }
}
