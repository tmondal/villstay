import 'package:flutter/material.dart';
import 'package:villstay/packages/package_calculator/package_calculator.dart';

class VacationPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle headingStyle = TextStyle(
      color: Colors.green[900],
      fontWeight: FontWeight.w500,
      fontSize: 30.0,
    );
    final TextStyle subHeadingStyle = TextStyle(
      color: Colors.green[900],
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
    );

    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
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
        actions: screenWidth > 1000
            ? <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    children: <Widget>[
                      Text("WhatsApp / Call Us : ", style: subHeadingStyle),
                      SelectableText("7003748502", style: subHeadingStyle)
                    ],
                  ),
                )
              ]
            : null,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // Entire website background gradient
            gradient: LinearGradient(colors: [
              Color(0xFFF8FBFF),
              Color(0xFFFCFDFD),
            ]),
          ),
          child: Padding(
            padding: screenWidth > 800
                ? const EdgeInsets.all(100)
                : const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Heaidng
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text("Vacation Packages for Sundarban",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0)))
                    ]),
                // subheading
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          child: Text(
                              "We provide both predefined packages and custom packages",
                              style: subHeadingStyle))
                    ]),
                SizedBox(height: 100),
                // packages heading
                screenWidth > 1000
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            Text("Our packages", style: subHeadingStyle)
                          ])
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text("Our packages", style: subHeadingStyle)
                          ]),
                SizedBox(height: 10),
                // predefined package cards
                screenWidth > 1000
                    ? Row(
                        children: <Widget>[
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 1 day 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 2 days 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 3 days 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          ))
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 1 day 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 2 days 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(children: <Widget>[
                              Text("Package for 3 days 1 person"),
                              Text("Price : xyz"),
                              Text("Attractions"),
                              RaisedButton(
                                onPressed: () {},
                                child: Text("See tour plan"),
                              )
                            ])),
                          ))
                        ],
                      ),
                SizedBox(height: 50),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child:
                              Text("Looks expensive ?", style: headingStyle)),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: Text("Create your own package",
                              style: headingStyle)),
                    ]),
                // package calculator
                PackageCalculator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
