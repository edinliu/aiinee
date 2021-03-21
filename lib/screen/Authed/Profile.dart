import 'package:flutter/material.dart';
import '../../helpers/fetchApi.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var nickName = '';

  getData() async {
    var res = await fetchApi('a/helloworld');
    setState(() {
      nickName = res['haha'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '請輸入個人資料:',
          ),
          Image.asset('assets/flower.jpg', height: 100, width: 100),
          TextFormField(
            cursorColor: TextSelectionThemeData().cursorColor,
            initialValue: 'Input text',
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.favorite),
              labelText: nickName,
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
              ),
              helperText: 'Helper text',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          TextFormField(
            cursorColor: TextSelectionThemeData().cursorColor,
            maxLength: 20,
            decoration: InputDecoration(
              icon: Icon(Icons.favorite),
              labelText: '生日',
              labelStyle: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              helperText: 'Helper text',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF6200EE)),
              ),
            ),
          ),
          TextButton(
            onPressed: getData,
            child: Text(
              "送出",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
