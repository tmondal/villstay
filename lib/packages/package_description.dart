import 'package:flutter/material.dart';

class PackageDescription extends StatelessWidget {
  final Map<String, Object> packageDescription;
  PackageDescription({@required this.packageDescription});

  @override
  Widget build(BuildContext context) {
    List<String> descriptionList = packageDescription['description'];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(packageDescription['title'],
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0)),
          Text(packageDescription['subtitle'],
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 15.0)),
          SizedBox(height: 20),
          Text("Activities",
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
          ...descriptionList.map((description) {
            return ListTile(
              leading: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle)),
              title: Text(description),
            );
          }).toList(),
          packageDescription['note'] != null
              ? RichText(
                  text: TextSpan(
                      text: "Note: ",
                      style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      children: [
                        TextSpan(
                            text: packageDescription['note'],
                            style: TextStyle(color: Colors.green))
                      ]),
                )
              : Container(),
        ],
      ),
    );
  }
}
