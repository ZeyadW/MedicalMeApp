import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/journal.dart';

<<<<<<< Updated upstream
class Addjournalbutton extends StatelessWidget {
=======
class addjournalbutton extends StatefulWidget {
  @override
  _addjournalbuttonState createState() => _addjournalbuttonState();
}

class _addjournalbuttonState extends State<addjournalbutton> {
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: const Color(0xffe0ecde),
      margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 40.0, bottom: 0.0),
      child: Row(children: [
        Text(
          'Journals:',
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
              '+ Journals',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Journal()),
              );
            },
          ),
        ),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
      ]),
    );
  }
}
