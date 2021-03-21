import 'package:flutter/material.dart';
import './Match.dart';
import './Profile.dart';
import './Chat.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authed extends StatefulWidget {
  Authed({Key key}) : super(key: key);
  @override
  _AuthedState createState() => _AuthedState();
}

class _AuthedState extends State<Authed> {
  int _selectedIndex = 0;
  Widget page = Match(title: '左滑右滑頁面');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0)
        page = Match(title: '左滑右滑頁面');
      else if (index == 1)
        page = Chat(title: '聊天頁面');
      else if (index == 2) page = Profile(title: 'Profile');
    });
  }

  void handleClick(String value) async {
    switch (value) {
      case 'Logout':
        await FirebaseAuth.instance.signOut();
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color.fromRGBO(100, 100, 100, 1),
        appBar: AppBar(
          title: Text('aiineee'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleClick,
              itemBuilder: (BuildContext context) {
                return ['Logout', 'Settings'].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: page,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Theme.of(context).primaryIconTheme.color,
              label: 'Match',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
