import 'package:flutter/material.dart';
import 'package:villstay/packages/package_button.dart';
import 'package:villstay/packages/package_description.dart';

class Packages extends StatelessWidget {
  final List<Map<String, Object>> packageDescriptionList = [
    {
      'packagetype': 'Adventure',
      'title': 'Package For Adventure Enthusiast',
      'subtitle':
          'For those who wants to take a break from normal life and spend a day with nature',
      'description': [
        'Walking inside Jungle',
        'Fishing from boat or edge of river',
        'Swiming in river',
      ],
      'note': 'Best for weekend trip'
    },
    {
      'packagetype': 'Vacation',
      'title': 'Packages For Visiting Popular Places',
      'subtitle':
          'For those who wants to visit all the popular places and enjoy nature\'s beauty',
      'description': [
        'Visit all the popular places',
        'Stay comfortably in Hotel',
        'Enjoy delicious local foods and fruits',
      ],
    },
  ];

  final List<Map<String, String>> packageImageList = [
    {'image': 'assets/images/bengal_deer.png'},
    {'image': 'assets/images/bengal_tiger.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Packages", style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return DesktopPackages(
                packageDescriptionList: packageDescriptionList,
                packageImageList: packageImageList,
              );
            } else {
              return MobilePackages(
                packageDescriptionList: packageDescriptionList,
              );
            }
          },
        ),
      ],
    );
  }
}

class DesktopPackages extends StatelessWidget {
  final List<Map<String, Object>> packageDescriptionList;
  final List<Map<String, String>> packageImageList;
  DesktopPackages(
      {@required this.packageDescriptionList, @required this.packageImageList});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Adventure row contains description followed by image
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                      width: screenWidth / 2,
                      child: PackageDescription(
                          packageDescription: packageDescriptionList[0])),
                ),
                Flexible(
                  child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(packageImageList[0]['image']))),
                      child: PackageButton(packageType: "Adventure")),
                )
              ],
            ),
          ),
          // vacation row contains image first then description
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: 300,
                        constraints: BoxConstraints(maxWidth: screenWidth / 2),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage(packageImageList[1]['image']))),
                        child: PackageButton(packageType: "Vacation")),
                  ),
                ),
                Flexible(
                    child: PackageDescription(
                        packageDescription: packageDescriptionList[1])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobilePackages extends StatelessWidget {
  final List<Map<String, Object>> packageDescriptionList;
  MobilePackages({@required this.packageDescriptionList});

  @override
  Widget build(BuildContext context) {
    // does not contain any images
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PackageDescription(packageDescription: packageDescriptionList[0]),
          SizedBox(height: 30),
          PackageButton(packageType: packageDescriptionList[0]['packagetype']),
          SizedBox(height: 100),
          PackageDescription(packageDescription: packageDescriptionList[1]),
          SizedBox(height: 30),
          PackageButton(packageType: packageDescriptionList[1]['packagetype']),
        ],
      ),
    );
  }
}
