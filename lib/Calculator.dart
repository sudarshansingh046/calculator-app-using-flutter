import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Calculator> {
  int firstnum, secondnum;
  String result = "";
  String textTodisplay = "";
  String operation = "";

  void btnClicked(String val) {
    if (val == "C") {
      firstnum = 0;
      secondnum = 0;
      result = "";
      textTodisplay = "";
      operation = "";
    } else if (val == "+" || val == "-" || val == "x" || val == "/") {
      firstnum = int.parse(textTodisplay);
      result = "";
      operation = val;
    } else if (val == "=") {
      secondnum = int.parse(textTodisplay);
      if (operation == "+") {
        result = (firstnum + secondnum).toString();
      }
      if (operation == "-") {
        result = (firstnum - secondnum).toString();
      }
      if (operation == "x") {
        result = (firstnum * secondnum).toString();
      }
      if (operation == "/") {
        result = (firstnum ~/ secondnum).toString();
      }
    } else {
      result = int.parse(textTodisplay + val).toString();
    }
    setState(() {
      textTodisplay = result;
    });
  }

  Widget customButton(String val) {
    return Expanded(
      child: OutlinedButton(
        child: Text(val),
        onPressed: () {
          btnClicked(val);
        },
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textTodisplay",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("+")
              ],
            ),
            Row(
              children: [
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("-")
              ],
            ),
            Row(
              children: [
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("x")
              ],
            ),
            Row(
              children: [
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/")
              ],
            )
          ],
        )));
  }
}
