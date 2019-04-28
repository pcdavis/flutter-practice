import 'package:flutter/material.dart';

class ProductCodeSearch extends StatefulWidget {
  ProductCodeSearch({Key key}) : super(key: key);

  _ProductCodeSearchState createState() => _ProductCodeSearchState();
}

class _ProductCodeSearchState extends State<ProductCodeSearch> {
  String _productCode;
  final GlobalKey<FormState> _productKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
          key: _productKey,
          child: TextFormField(
            onSaved: (input) => _productCode,
            decoration: InputDecoration(labelText: 'Enter your product code'),
          )),
    );
  }
}
