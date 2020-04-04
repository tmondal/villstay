import 'package:flutter/material.dart';
import 'package:villstay/Footer/footer.dart';
import 'package:villstay/about_us/about_us.dart';
import 'package:villstay/gallery/gallery.dart';
import 'package:villstay/home_page/home_page.dart';
import 'package:villstay/places_page/places.dart';
import 'package:villstay/why_us/why_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homekey = GlobalKey();
    final placeskey = GlobalKey();
    final gallery = GlobalKey();
    final whyus = GlobalKey();
    final aboutus = GlobalKey();

    List<String> navItems = ['Places', 'Gallery', 'Why Us', 'About Us'];
    List<GlobalKey> globalKeys = [placeskey, gallery, whyus, aboutus];

    void onAddButtonTapped(int index) {
      Scrollable.ensureVisible(globalKeys[index].currentContext);
    }

    Widget navItem(String _item) {
      return Container(
        child: MaterialButton(
          onPressed: () {
            onAddButtonTapped(navItems.indexOf(_item));
          },
          splashColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VillStay',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home: Container(
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
            title: MaterialButton(
              onPressed: () {
                Scrollable.ensureVisible(homekey.currentContext);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
            actions: <Widget>[
              ...navItems.map((item) => navItem(item)).toList()
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(fit: FlexFit.loose, child: HomePage(), key: homekey),
                Flexible(fit: FlexFit.loose, child: Places(), key: placeskey),
                Flexible(fit: FlexFit.loose, child: Gallery(), key: gallery),
                Flexible(fit: FlexFit.loose, child: WhyUs(), key: whyus),
                Flexible(fit: FlexFit.loose, child: AboutUs(), key: aboutus),
                Flexible(fit: FlexFit.loose, child: Footer()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
