import 'dart:ui';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int index = 0;
  List<Map<String, String>> slidelist = [
    {
      'image': 'assets/images/bengal_deer.png',
      'title': 'Mangrove Tour',
      'subtitle': 'Explore natural beauty'
    },
    {
      'image': 'assets/images/bengal_tiger.png',
      'title': 'Adventure Journey',
      'subtitle': 'Jungle hoping and Fishing'
    },
    {
      'image': 'assets/images/sundarban_pic.png',
      'title': 'Stay In Village',
      'subtitle': 'Enjoy village life a little'
    },
  ];

  // animation
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 5),
      // This takes in the TickerProvider, which is this _AnimationPageState object
      vsync: this,
    );

    // Tween converts range
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      // starting will be slow
      curve: Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
          index = (index + 1) % slidelist.length;
        }
      });
    // Goes from 0 to 1, we'll do something with these values later on
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Stack(
        children: <Widget>[
          // carousal at the bottom
          Opacity(
            opacity: animation.value,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    slidelist[index]['image'],
                  ),
                ),
              ),
            ),
          ),
          // Texts at top
          Opacity(
            opacity: animation.value,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      slidelist[index]['title'],
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xFF8591B0),
                      ),
                    ),
                    Text(
                      slidelist[index]['subtitle'],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat-Regular",
                        color: Color(0xFF8591B0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
