import 'package:flutter/material.dart';
import 'package:fluttermusicui/constants/constants.dart';
import 'package:fluttermusicui/screens/homepage.dart';

void main() => runApp(Entrance());

class Entrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      home: Homepage(),
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}
