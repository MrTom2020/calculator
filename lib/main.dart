import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: SafeArea(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("____"),
        backgroundColor: Color.fromRGBO(254, 246, 250, .8),
      ),
      body: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<StatefulWidget> createState() => MyAppPageState();
}

class MyAppPageState extends State<MyAppPage> {
  String s = "0";
  double n1 = 0;
  double n2 = 0;
  String _ouput = "0";
  String operand = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      n1 = n2 = 0;
      operand = "0";
      _ouput = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      n1 = double.parse(_ouput);
      operand = buttonText;
      _ouput = "0";
    } else if (buttonText == "=") {
      n2 = double.parse(s);
      if (operand == "+") {
        _ouput = (n1 + n2).toString();
      }
      if (operand == "-") {
        _ouput = (n1 - n2).toString();
      }
      if (operand == "*") {
        _ouput = (n1 * n2).toString();
      }
      if (operand == "/") {
        _ouput = (n1 / n2).toString();
      }
      n1 = n2 = 0;
      operand = "";
    } else {
      _ouput = _ouput + buttonText;
    }
    setState(() {
      s = double.parse(_ouput).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              buttonPressed(buttonText);
            },
            child: Text(buttonText,
                style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))));
  }

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      body: Container(
        child: Wrap(
          runSpacing: 40.0,
          children: [
            Expanded(
              child: Container(
                height: 80,
                width: WidgetsBinding.instance.window.physicalSize.width,
                color: Color.fromRGBO(0, 0, 0, 1),
                child: Text(
                  s,textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white,fontSize: 30,),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: 20,
            )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*")
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-")
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton("="),
                buildButton("C"),
                buildButton("C"),
                //ElevatedButton(onPressed: () {}, child: Text("=")),
                buildButton("+")
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
