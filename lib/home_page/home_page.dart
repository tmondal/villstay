import 'package:flutter/material.dart';
import 'package:villstay/home_page/desktop_home_page.dart';
import 'package:villstay/home_page/mobile_home_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // for desktop
        if (constraints.maxWidth > 800) {
          return DesktopHomePage();
        }
        // for mobile
        else {
          return MobileHomePage();
        }
      },
    );
  }
}
