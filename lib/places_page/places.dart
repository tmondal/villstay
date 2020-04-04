import 'package:flutter/material.dart';
import 'package:villstay/places_page/desktop_places.dart';
import 'package:villstay/places_page/mobile_places.dart';

class Places extends StatelessWidget {
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
              return DesktopPlaces();
            } else {
              return MobilePlaces();
            }
          },
        ),
      ],
    );
  }
}
