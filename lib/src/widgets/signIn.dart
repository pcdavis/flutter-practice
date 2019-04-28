import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../pages/home.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget();

  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignInWidget> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'A valid email is required';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'A valid password is required';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign In'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
