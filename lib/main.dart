import 'package:flutter/material.dart';
import 'package:tripsflutterapp/home.dart';
import 'package:tripsflutterapp/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: MyHomePage(),
    );
  }
}
