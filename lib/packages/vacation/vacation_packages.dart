import 'package:flutter/material.dart';
import 'package:villstay/packages/vacation/desktop_vacation_packages.dart';
import 'package:villstay/packages/vacation/mobile_vacation_packages.dart';

class VacationPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopVacationPackages();
        } else {
          return MobileVacationPackages();
        }
      },
    );
  }
}
