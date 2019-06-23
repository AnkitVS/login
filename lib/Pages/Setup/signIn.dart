import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _pass;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Enter Email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Your Password is Small';
                  }
                },
                onSaved: (input) => _pass = input,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              RaisedButton(onPressed: signIn, child: Text('Sign In'))
            ],
          )),
    );
  }

  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pass);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
