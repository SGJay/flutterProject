import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  void clearText() {
    _usernameController.clear();
    _passwordController.clear();
  }

  void login() {
    if (_usernameController.text == '12180071' &&
        _passwordController.text == 'gg0723') {
      Navigator.pop(context);
    } else {
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Column(
              children: <Widget>[
                FlutterLogo(
                  size: 100,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Flutter',
                  style: TextStyle(fontSize: 20, color: Colors.blue[500]),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'UserName',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: clearText,
                ),
                RaisedButton(
                    child: Text('NEXT'),
                    onPressed: login,
                    elevation: 2,
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
