import 'package:flutter/material.dart';

import 'widgets/signUp.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello World'),
            centerTitle: true,
          ),
          body: SignUpWidget(),
        ));
  }
}
