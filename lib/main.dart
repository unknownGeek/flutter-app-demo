import 'package:flutter/material.dart';
import 'package:flutterdemo1/HomePage.dart';

import 'CustomDrawer.dart';
import 'CustomGuitarDrawer.dart';
import 'FlutterConstants.dart' as FlutterConstants;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    bool flip = FlutterConstants.TO_BE_FLIPPED;

    AppBar appBar = flip
        ? AppBar()
        : AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => handlePressed(context),
                );
              },
            ),
            title: Text('Fun Chat'),
            centerTitle: true,
        );

    Widget child = HomePage(appBar: appBar);

    if (flip) {
      child = CustomGuitarDrawer(child: child);
    } else {
      child = CustomDrawer(child: child);
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: child,
    );
  }

  void handlePressed(BuildContext context) {
        CustomDrawer.of(context).open();
  }

}