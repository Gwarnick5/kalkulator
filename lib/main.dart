import 'package:flutter/material.dart';
void main() {
  runApp(myApp());
}
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kalkulator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Button(""),
                Button("%"),
                Button("C"),
                Button("AC"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("7"),
                Button("8"),
                Button("9"),
                Button("÷"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("4"),
                Button("5"),
                Button("6"),
                Button("x"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("1"),
                Button("2"),
                Button("3"),
                Button("-"),
              ],
            ),
            Row(
              children: <Widget>[
                Button("0"),
                Button("."),
                Button("="),
                Button("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget Button(String value) {
    return Expanded(
      child: OutlinedButton(

        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 35.0, color: Colors.black),
        ),
      ),
    );
  }
  double num1 = 0;
  double num2 = 0;
  String res = "";
  String text = "";
  String opp = "";
  void btnClicked(String btnText) {
    if (btnText == "AC") {
      res = "";
      text = "";
      num1 = 0;
      num2 = 0;
    }
    else if(btnText == "C"){
      res = res.substring(0, res.length - 1);
    }
    else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "÷" || btnText == "%") {
      num1 = double.parse(text);
      res = "";
      opp = btnText;
    }
    else if (btnText == "=") {
      num2 = double.parse(text);
      if (opp == "+") {
        res = (num1 + num2).toString();
      }
      else if (opp == "-") {
        res = (num1 - num2).toString();
      }
      else if (opp == "x") {
        res = (num1 * num2).toString();
      }
      else if (opp == "÷") {
        res = (num1 / num2).toString();
      }
      else if (opp == "%") {
        //res = double.parse(res / 100).toString();
      }
    }
    else if(btnText == "."){
      if(!res.contains(".")){
        res = res + ".";
      }
    }
    else {
      res = text + btnText;
    }
    setState(() {
      text = res;
    });
  }
}