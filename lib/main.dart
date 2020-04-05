import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:villstay/Footer/footer.dart';
import 'package:villstay/about_us/about_us.dart';
import 'package:villstay/gallery/gallery.dart';
import 'package:villstay/home/home.dart';
import 'package:villstay/packages/packages.dart';
import 'package:villstay/places/places.dart';
import 'package:villstay/route_generator.dart';
import 'package:villstay/why_us/why_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VillStay',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  final List<String> navItems = ['Places', 'Packages', 'Gallery', 'Why Us'];
  final List<Widget> widgetList = [
    Home(),
    Places(),
    Packages(),
    Gallery(),
    WhyUs(),
    AboutUs(),
    Footer()
  ];

  Widget navItem(String _item) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          itemScrollController.scrollTo(
            index: navItems.indexOf(_item) + 1,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        },
        splashColor: Colors.green,
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

  Widget drawerItem(String _item, BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          Navigator.pop(context);
          itemScrollController.scrollTo(
            index: navItems.indexOf(_item) + 1,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
          );
        },
        title: Text(
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
    double _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        // Entire website background gradient
        gradient: LinearGradient(colors: [
          Color(0xFFF8FBFF),
          Color(0xFFFCFDFD),
        ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: _screenWidth < 800 ? Icon(Icons.menu) : null,
          title: MaterialButton(
            onPressed: () {
              itemScrollController.scrollTo(
                index: 0,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutCubic,
              );
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            splashColor: Colors.green,
            child: Text(
              "VillStay",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat-Regular",
                color: Colors.green,
              ),
            ),
          ),
          actions: _screenWidth >= 800
              ? <Widget>[...navItems.map((item) => navItem(item)).toList()]
              : null,
        ),
        drawer: _screenWidth < 800
            ? Drawer(
                child: Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Wellcome to \n VillStay",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat-Regular",
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                  ...navItems.map((item) => drawerItem(item, context)).toList()
                ],
              ))
            : null,
        backgroundColor: Colors.transparent,
        body: ScrollablePositionedList.builder(
          itemCount: widgetList.length,
          itemBuilder: (context, index) {
            return widgetList[index];
          },
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionListener,
        ),
      ),
    );
  }
}
