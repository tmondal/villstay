import 'package:flutter/material.dart';
import 'package:villstay/places_page/place.dart';

class DesktopPlaces extends StatelessWidget {
  final List<Map<String, String>> placeList = [
    {
      'image': 'assets/images/bengal_deer.png',
      'title': 'Best places of Sundarban',
      'subtitle': 'Explore natural beauty'
    },
    {
      'image': 'assets/images/bengal_tiger.png',
      'title': 'Random mangrove',
      'subtitle': 'Infinite River'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Place(place: placeList[0]),
            SizedBox(width: 20),
            Place(place: placeList[1])
          ],
        ),
      ),
    );
  }
}
