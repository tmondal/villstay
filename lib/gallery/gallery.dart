import 'package:flutter/material.dart';
import 'package:villstay/gallery/image_box.dart';

class Gallery extends StatelessWidget {
  final List<Map<String, String>> imagelist = [
    {
      'imageurl': 'assets/images/bengal_deer.png',
      'title': 'Mangrove Tour',
      'subtitle': 'Explore natural beauty'
    },
    {
      'imageurl': 'assets/images/bengal_tiger.png',
      'title': 'Adventure Journey',
      'subtitle': 'Jungle hoping and Fishing'
    },
    {
      'imageurl': 'assets/images/sundarban_pic.png',
      'title': 'Stay In Village',
      'subtitle': 'Enjoy village life a little'
    },
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Gallery", style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          primary: false,
          childAspectRatio: 2,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: screenWidth > 800 ? 3 : (screenWidth > 500 ? 2 : 1),
          children: <Widget>[
            ...imagelist.map((image) => ImageBox(image: image)).toList(),
          ],
        )
      ],
    );
  }
}
