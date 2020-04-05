import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final Map<String, String> image;
  ImageBox({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        image['imageurl'],
        fit: BoxFit.cover,
      ),
    );
  }
}
