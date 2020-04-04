import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  final Map<String, String> place;
  Place({this.place});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 300,
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
                height: 40,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 30.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Our packages",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
