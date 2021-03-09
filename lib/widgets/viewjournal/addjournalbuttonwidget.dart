import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/journal.dart';
//import 'package:project_mobile/widgets/viewjournal/listalljournals.dart' as l;
//import 'package:cloud_firestore/cloud_firestore.dart';

class Addjournalbutton extends StatelessWidget {
  //List<String> dropDown = <String>["Default", "Diary title", "Date"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: const Color(0xffe0ecde),
      margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 20.0, bottom: 0.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 10.0,
            right: 125.0,
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
        new DropdownButton<String>(
            underline: Container(),
            icon: Icon(Icons.sort, color: Colors.green),
            items: <String>["Default", "Diary title", "Date"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              /*  switch (value) {
                case 'Default':
                  l.x = FirebaseFirestore.instance
                      .collection('Diaries')
                      .orderBy('title', descending: true)
                      .snapshots();
                  break;
                case 'Diary title':
                  l.x = FirebaseFirestore.instance
                      .collection('Diaries')
                      .orderBy('title', descending: true)
                      .snapshots();
                  break;
                case 'Date':
                  l.x = FirebaseFirestore.instance
                      .collection('Diaries')
                      .orderBy('date', descending: true)
                      .snapshots();
                  break;
              }*/
            })
      ]),
    );
  }
}
