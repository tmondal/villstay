import 'package:flutter/material.dart';
import 'package:villstay/packages/adventure/desktop_adventure_packages.dart';
import 'package:villstay/packages/adventure/mobile_adventure_packages.dart';

class AdventurePackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopAdventurePackages();
        } else {
          return MobileAdventurePackages();
        }
      },
    );
  }
}
