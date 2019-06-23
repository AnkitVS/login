import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/Setup/signIn.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
              RaisedButton(onPressed: signUp, child: Text('Sign In'))
            ],
          )
          ),
    );
  }

  void signUp() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _pass);
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      } catch (e) {
        print(e.message);
      }
    }
  }
  }
}