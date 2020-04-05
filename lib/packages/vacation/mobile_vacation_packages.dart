import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MobileVacationPackages extends StatelessWidget {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Entire website background gradient
        gradient: LinearGradient(colors: [
          Color(0xFFF8FBFF),
          Color(0xFFFCFDFD),
        ]),
      ),
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
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
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  children: <Widget>[
                    Text(
                      "WhatsApp / Call Us : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.green,
                      ),
                    ),
                    SelectableText(
                      "7003748502",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: ScrollablePositionedList.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Vacation Packages for Sundarban Tour",
                            style: TextStyle(fontSize: 40)),
                      ],
                    ),
                  ),
                  Text(
                    "Paik vai kemon achen ? \nAr Boudi kemon achen ?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat-Regular",
                      color: Colors.green,
                    ),
                  ),
                  FaIcon(FontAwesomeIcons.smile, color: Colors.red)
                ],
              );
            },
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionListener,
          ),
        ),
      ),
    );
  }
}
