import 'package:calculator/Calculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator",
      theme: ThemeData(primaryColor: Colors.red),
      home: Calculator(),
    );
  }
}
