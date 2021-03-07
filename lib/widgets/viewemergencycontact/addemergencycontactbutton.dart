import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/addemergencycontact.dart';

class Addemergencybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: const Color(0xffe0ecde),
      margin: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
      child: Row(children: [
        Text(
          'Emergency Contact:',
          style: TextStyle(
              fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 10.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              '+ Emergency Contact',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addemergencycontactscreen()),
              );
            },
          ),
        )
      ]),
    );
  }
}
