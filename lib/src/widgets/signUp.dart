import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../pages/dashboard.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget();

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpWidget> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Create Your Account'),
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  RaisedButton(
                    onPressed: signUp,
                    child: Text('Create Account'),
                  )
                ],
              ),
            ),
          ),
          FlatButton(
            child: Text('Already have an account? Sign In'),
            onPressed: goToSignIn,
          ),
        ],
      ),
    );
  }

  Future<void> signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Dashboard(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void goToSignIn() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Dashboard(user: null)));
  }
}
