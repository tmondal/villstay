import 'package:flutter/material.dart';
import 'package:villstay/packages/package_calculator/desktop_package_calculator.dart';
import 'package:villstay/packages/package_calculator/mobile_package_calculator.dart';

class PackageCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1000) {
          return DesktopPackageCalculator();
        } else {
          return MobilePackageCalculator();
        }
      },
    );
  }
}
