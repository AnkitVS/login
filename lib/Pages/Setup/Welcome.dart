import 'package:flutter/material.dart';
import 'package:login/Pages/Setup/signIn.dart';
import 'package:login/Pages/Setup/signup.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Firebase"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(onPressed: NavigateToSignIn, child: Text('Sign In')),
          RaisedButton(onPressed: NavigateToSignUp, child: Text('Sign Up'))
        ],
      ),
    );
  }

  void NavigateToSignIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login(), fullscreenDialog: true));
  }

  void NavigateToSignUp() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => signUp(), fullscreenDialog: true));
  }
}
