import 'package:flutter/material.dart';
import 'package:villstay/places/place.dart';

class Places extends StatelessWidget {
  final List<Map<String, Object>> placeList = [
    {
      'image': 'assets/images/bengal_deer.png',
      'title': 'Best places of Sundarban',
      'subtitle': 'Explore natural beauty',
      'attractions': [
        'Jharkhali National Park',
        'Sajnekhali watch tower',
        'Pakhiraloy',
      ],
    },
    {
      'image': 'assets/images/bengal_tiger.png',
      'title': 'Random mangrove',
      'subtitle': 'Infinite River',
      'attractions': [
        'Random National Park',
        'Random watch tower',
        'Randomloy',
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Places", style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return DesktopPlaces(placeList: placeList);
            } else {
              return MobilePlaces(placeList: placeList);
            }
          },
        ),
      ],
    );
  }
}

class DesktopPlaces extends StatelessWidget {
  final List<Map<String, Object>> placeList;
  DesktopPlaces({this.placeList});

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

class MobilePlaces extends StatelessWidget {
  final List<Map<String, Object>> placeList;
  MobilePlaces({this.placeList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
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
