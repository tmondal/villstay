import 'dart:ui';
import 'package:flutter/material.dart';

class DesktopHomePage extends StatefulWidget {
  @override
  _DesktopHomePageState createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage>
    with SingleTickerProviderStateMixin {
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

  List<String> navItems = ['Places', 'Gallery', 'Why Us', 'About Us'];

  TextStyle menuItemStyle = TextStyle(
    fontFamily: "Montserrat-Regular",
    color: Colors.green,
  );

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

  Widget navItem(String _item) {
    return Container(
      child: MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          _item,
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            letterSpacing: 1,
            fontFamily: "Montserrat-Bold",
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white, Colors.white]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "VillStay",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-Regular",
                    color: Colors.green,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ...navItems.map((item) => navItem(item)).toList()
                  ],
                )
              ],
            ),
          ),
        ),
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
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
