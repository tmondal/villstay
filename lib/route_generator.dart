import 'package:flutter/material.dart';
import 'package:villstay/main.dart';
import 'package:villstay/packages/adventure/adventure_packages.dart';
import 'package:villstay/packages/vacation/vacation_packages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/adventure-packages':
        return MaterialPageRoute(builder: (_) => AdventurePackages());
      case '/vacation-packages':
        return MaterialPageRoute(builder: (_) => VacationPackages());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
            child: Column(
          children: <Widget>[
            Text("Wrong page. Something wrong !!"),
            Text("Please help us fix this. Report the bug."),
            Text("Take screen shot and send us via WhatsApp from help section")
          ],
        )),
      );
    });
  }
}
