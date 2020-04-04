import 'package:flutter/material.dart';
import 'package:villstay/places_page/place.dart';

class MobilePlaces extends StatelessWidget {
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Place(place: placeList[0]),
          SizedBox(height: 20),
          Place(place: placeList[1])
        ],
      ),
    );
  }
}
