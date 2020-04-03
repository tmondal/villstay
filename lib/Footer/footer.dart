import 'package:flutter/material.dart';
import 'package:villstay/Footer/desktop_footer.dart';
import 'package:villstay/Footer/mobile_footer.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopFooter();
        } else
          return MobileFooter();
      },
    );
  }
}
