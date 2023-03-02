import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
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
          children:[
            Container(
              child: Text(
                wynik,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
            ),
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
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
              ),
            ),
            Row(
              children: <Widget>[
                TextButton(onPressed: ()=> btnClicked(""), child: Text(""), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('%'), child: Text("%"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('C'), child: Text("C"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('AC'), child: Text("AC"), style: TextButton.styleFrom(),),
              ],
            ),
            Row(
              children: <Widget>[
                TextButton(onPressed: ()=> btnClicked('7'), child: Text("7"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('8'), child: Text("8"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('9'), child: Text("9"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('÷'), child: Text("÷"), style: TextButton.styleFrom(),),
              ],
            ),
            Row(
              children: <Widget>[
                TextButton(onPressed: ()=> btnClicked('4'), child: Text("4"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('5'), child: Text("5"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('6'), child: Text("6"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('x'), child: Text("x"), style: TextButton.styleFrom(),),

              ],
            ),
            Row(
              children: <Widget>[
                TextButton(onPressed: ()=> btnClicked('3'), child: Text("3"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('2'), child: Text("2"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('1'), child: Text("1"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('-'), child: Text("-"), style: TextButton.styleFrom(),),

              ],
            ),
            Row(
              children: <Widget>[
                TextButton(onPressed: ()=> btnClicked('0'), child: Text("0"), style: TextButton.styleFrom(),),
                TextButton(onPressed: ()=> btnClicked('.'), child: Text("."), style: TextButton.styleFrom(fixedSize: Size(200, 100)),),
                TextButton(onPressed: ()=> btnClicked('='), child: Text("="), style: TextButton.styleFrom(backgroundColor: Colors.cyan, foregroundColor: Colors.white),),
                TextButton(onPressed: ()=> btnClicked('+'), child: Text("+"), style: TextButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 10),),),

              ],
            ),
          ],
        ),
      ),
    );
  }

  String text = "", wynik = "", opp = "";
  double a = 0, b = 0;
  void btnClicked(String btnText) {
    if(btnText == "C"){
      text = text.substring(0, text.length - 1);
      wynik = wynik.substring(0, wynik.length - 1);
    }
    else if(btnText == "AC"){
      text = "";
      wynik = "";
      opp = "";
      a = 0;
      b = 0;
    }
    else if(btnText == "."){
      if(!text.contains(".")){
        text += ".";
      }
    }
    else if(btnText == "+" || btnText == "-" || btnText == "x" || btnText == "÷" || btnText == "%"){
        opp = btnText;
        wynik += btnText;
        a = double.parse(text);
        text = "";
    }
    else if(btnText == "="){
      wynik += "=";
      b = double.parse(text);
      if (opp == "+") {
        text = (a + b).toString();
      }
      else if (opp == "-") {
        text = (a - b).toString();
      }
      else if (opp == "x") {
        text = (a * b).toString();
      }
      else if (opp == "÷") {
        text = (a / b).toString();
      }
      else if (opp == "%") {
        text = (a % b).toString();
      }
      opp = "";
    }
    else{
      text = text + btnText;
      wynik += btnText;
    }
    setState(() {
      text = text;

    });
  }
}