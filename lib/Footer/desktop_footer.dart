import 'package:flutter/material.dart';

class DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("VillStay @ 2020")],
      ),
    );
  }
}
