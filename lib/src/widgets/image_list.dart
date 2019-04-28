import 'package:flutter/material.dart';
import '../models/image_model.dart';
import './basic_card.dart';
import './image_overlay.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, int index) {
            var imgUrl = images[index].url;
            var imgTitle = images[index].title;
            return ImageOverlay(imgUrl, imgTitle);
          },
        ));
  }
}
