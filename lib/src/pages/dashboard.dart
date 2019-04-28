import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../product_list.dart';
import '../widgets/product_code_search.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('${widget.user.email}'),
            ProductCodeSearch(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
