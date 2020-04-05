import 'package:flutter/material.dart';

class PackageButton extends StatelessWidget {
  final String packageType;
  PackageButton({this.packageType});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          height: 40,
          child: RaisedButton(
            onPressed: () {
              if (packageType == 'Adventure')
                Navigator.of(context).pushNamed('/adventure-packages');
              else if (packageType == 'Vacation')
                Navigator.of(context).pushNamed('/vacation-packages');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  packageType + " packages",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
