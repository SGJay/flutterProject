import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Parser p = Parser();
  String _result = '0';

  void _setTotal(String btnVal) {
    setState(() {
      if (btnVal == '=') {
        Expression exp = (Parser()).parse(_result);
        double res = double.parse(
            exp.evaluate(EvaluationType.REAL, ContextModel()).toString());
        _result =
            double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
                ? res.toStringAsFixed(0)
                : res.toStringAsFixed(4);
      } else if (btnVal == 'C') {
        _result = '0';
      } else {
        _result += btnVal;
      }
    });
  }

  Widget _numberButton(String btnVal) {
    return Container(
        padding: EdgeInsets.all(1),
        height: 100,
        width: 100,
        child: RaisedButton(
          child: Text(
            btnVal,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          color: Colors.white,
          onPressed: () => _setTotal(btnVal),
        ));
  }

  Widget _allButton() {
    return SafeArea(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _numberButton('1'),
              _numberButton('2'),
              _numberButton('3'),
              _numberButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _numberButton('4'),
              _numberButton('5'),
              _numberButton('6'),
              _numberButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _numberButton('7'),
              _numberButton('8'),
              _numberButton('9'),
              _numberButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _numberButton('C'),
              _numberButton('0'),
              _numberButton('='),
              _numberButton('/'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _displayPlace() {
    return Container(
      // Display Container
      constraints: BoxConstraints.expand(
        // Creating a boxed container
        height: 150,
      ),
      alignment: Alignment
          .bottomRight, // Aligning the text to the bottom right of our display screen
      color: Colors.white, // Seting the background color of the container
      child: Text(
        _result,
        style: TextStyle(
            // Styling the text
            fontSize: 50.0,
            color: Colors.black),
        textAlign: TextAlign.right,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _displayPlace(),
            SizedBox(
              height: 100,
            ),
            _allButton(),
          ],
        ),
      ),
    );
  }
}
