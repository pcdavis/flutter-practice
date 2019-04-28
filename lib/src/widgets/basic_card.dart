import 'package:flutter/material.dart';

class BasicCard extends StatelessWidget {
  final imgUrl;
  final imgTitle;

  const BasicCard(this.imgUrl, this.imgTitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.all(5.0),
      child: Card(
          child: Column(
        children: <Widget>[
          Image.network(imgUrl),
          Text(imgTitle),
        ],
      )),
    );
  }
}
