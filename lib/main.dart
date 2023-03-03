import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kalkulator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.black,
            ),
            child: Text(
              wynik,
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  color: Colors.black,
              ),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildTextButton("x²", kSign, kFontBlack),
                  buildTextButton("%", kSign, kFontBlack),
                  buildTextButton("C", kDelete, kFontWhite),
                  buildTextButton("AC", kDelete, kFontWhite),
                ],
              ),
              Row(
                children: <Widget>[
                  buildTextButton("7", kNum, kFontBlack),
                  buildTextButton("8", kNum, kFontBlack),
                  buildTextButton("9", kNum, kFontBlack),
                  buildTextButton("÷", kSign, kFontBlack),
                ],
              ),
              Row(
                children: <Widget>[
                  buildTextButton("4", kNum, kFontBlack),
                  buildTextButton("5", kNum, kFontBlack),
                  buildTextButton("6", kNum, kFontBlack),
                  buildTextButton("x", kSign, kFontBlack),
                ],
              ),
              Row(
                children: <Widget>[
                  buildTextButton("3", kNum, kFontBlack),
                  buildTextButton("2", kNum, kFontBlack),
                  buildTextButton("1", kNum, kFontBlack),
                  buildTextButton("-", kSign, kFontBlack),
                ],
              ),
              Row(
                children: <Widget>[
                  buildTextButton(".", kSign, kFontBlack),
                  buildTextButton("0", kNum, kFontBlack),
                  buildTextButton("=", kEquals, kFontWhite),
                  buildTextButton("+", kSign, kFontBlack),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  Color kNum =  const Color(0x0fffff3b0);
  Color kSign = const Color(0x0ffe09f3e);
  Color kDelete = const Color(0xff9e2a2b);
  Color kEquals = const Color(0x0ff540b0e);
  Color kFontWhite = const Color(0x0ffffffff);
  Color kFontBlack = const Color(0x0ff000000);

  Widget buildTextButton(String value, Color color, Color font) => Padding(
    padding: const EdgeInsets.all(1.0),
    child: TextButton(onPressed: ()=> btnClicked(value),
      style: TextButton.styleFrom(
          fixedSize: const Size(105, 50),
          backgroundColor: color,
          ),
      child:  Text(
          value,
          style: TextStyle(
              color: font,
              fontSize: 27.5,
            ),
          ),
        ),
  );


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
    else if(btnText == "%"){
      a = double.parse(text);
      text = (a / 100).toStringAsFixed(2).toString();
      zaokrglanie();
      wynik += "%=" + text;
      a = 0;
    }
    else if(btnText == "x²"){
      a = double.parse(text);
      text = (a * a).toStringAsFixed(2).toString();
      zaokrglanie();
      wynik += "^2=" + text;
      a = 0;
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
        text = (a + b).toStringAsFixed(2).toString();
      }
      else if (opp == "-") {
        text = (a - b).toStringAsFixed(2).toString();
      }
      else if (opp == "x") {
        text = (a * b).toStringAsFixed(2).toString();
      }
      else if (opp == "÷") {
        text = (a / b).toStringAsFixed(2).toString();
      }
      else if (opp == "%") {
        text = (a % b).toStringAsFixed(2).toString();
      }
      zaokrglanie();
      wynik += text;
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
  void zaokrglanie(){
    if(text.contains(".00")){
      text = text.substring(0, text.length - 3);
    }
    else if(text.contains(".01")||text.contains(".02")||text.contains(".03")||text.contains(".04")||text.contains(".05")||text.contains(".06")||text.contains(".07")||text.contains(".08")||text.contains(".09")){
      text = text;
    }
    else if(text.contains(".0")){
      text = text.substring(0, text.length - 2);
    }
  }
}