import 'package:flutter/material.dart';

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

  Widget addPlace(Map<String, String> place, BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(place['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Text(
                  place['title'],
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF6078ea).withOpacity(.3),
                        offset: Offset(0, 8),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Our Packages",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1,
                        fontFamily: "Montserrat-Bold",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            addPlace(placeList[0], context),
            SizedBox(width: 20),
            addPlace(placeList[1], context)
          ],
        ),
      ),
    );
  }
}
