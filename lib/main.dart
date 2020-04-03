import 'package:flutter/material.dart';
import 'package:villstay/Footer/footer.dart';
import 'package:villstay/home_page/home_page.dart';
import 'package:villstay/places_page/places.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageController _pagecontroller = PageController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            controller: _pagecontroller,
            children: <Widget>[
              HomePage(),
              Places(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
