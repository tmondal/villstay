import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final Map<String, Object> place;
  Place({this.place});

  @override
  Widget build(BuildContext context) {
    List<String> attractions = place['attractions'];
    return Flexible(
      child: Container(
        height: 400,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(place['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
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
              Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: <Widget>[
                    Text("Attractions",
                        style: TextStyle(
                            backgroundColor: Colors.white70,
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    ...attractions.map((attraction) {
                      return ListTile(
                        leading: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.white70, shape: BoxShape.circle),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.green[800],
                                shape: BoxShape.circle),
                          ),
                        ),
                        title: Text(attraction,
                            style: TextStyle(
                                backgroundColor: Colors.white70,
                                color: Colors.green[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
