import 'package:flutter/material.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import './screen/Match.dart';

void main() {
  runApp(MaterialApp(
    home: Match(title: '123'),
    navigatorObservers: [NavigationHistoryObserver()],
  ));
}
