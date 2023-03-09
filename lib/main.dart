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
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
    ),
    body: Column(
    mainAxisAlignment: MainAxisAlignment.end,
        children:[
          Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 26, 26, 26),
                ),
                child: Text(
                  wynik,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
          ),
          Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 26, 26, 26),
              ),
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            color: Color.fromARGB(255, 26, 26, 26),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    buildTextButton("x²", kSign, kFontWhite),
                    buildTextButton("%", kSign, kFontWhite),
                    buildTextButton("C", kSign, kFontWhite),
                    buildTextButton("AC", kSign, kFontWhite),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildTextButton("7", kNum, kFontWhite),
                    buildTextButton("8", kNum, kFontWhite),
                    buildTextButton("9", kNum, kFontWhite),
                    buildTextButton("÷", kSign, kFontWhite),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildTextButton("4", kNum, kFontWhite),
                    buildTextButton("5", kNum, kFontWhite),
                    buildTextButton("6", kNum, kFontWhite),
                    buildTextButton("x", kSign, kFontWhite),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildTextButton("3", kNum, kFontWhite),
                    buildTextButton("2", kNum, kFontWhite),
                    buildTextButton("1", kNum, kFontWhite),
                    buildTextButton("-", kSign, kFontWhite),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildTextButton(".", kSign, kFontWhite),
                    buildTextButton("0", kNum, kFontWhite),
                    buildTextButton("=", kEquals, kFontBlack),
                    buildTextButton("+", kSign, kFontWhite),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Color kNum =  const Color(0x0ff4d4d4d);
  Color kSign = const Color(0x0ff333333);
  Color kEquals = const Color(0x0ff1a8cff);
  Color kFontWhite = const Color(0x0ffffffff);
  Color kFontBlack = const Color(0x0ff000000);

  Widget buildTextButton(String value, Color color, Color font) => Padding(
    padding: const EdgeInsets.all(1.0),
    child: TextButton(onPressed: ()=> btnClicked(value),
      style: TextButton.styleFrom(
          fixedSize: const Size(100, 75),
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
        wynik += ".";
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