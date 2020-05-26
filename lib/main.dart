import 'package:flutter/material.dart';
import 'package:flutterdemo1/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat App',
      home: new HomePage()
    );
  }
}
