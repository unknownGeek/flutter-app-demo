import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomePage extends StatelessWidget {

  final AppBar appBar;

  HomePage({Key key, @required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar,
      body: new ChatScreen()
    );
  }

}