import 'package:flutter/material.dart';

class ImageOverlay extends StatelessWidget {
  final imgUrl;
  final imgTitle;
  const ImageOverlay(this.imgUrl, this.imgTitle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 200,
        width: 400,
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: 400,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(imgUrl),
              ),
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              child: Text(
                "$imgTitle",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
