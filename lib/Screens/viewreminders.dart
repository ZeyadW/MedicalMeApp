//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'searchmedicine.dart';
//import 'package:project_mobile/Screens/Addmedicine.dart';
import '../widgets/reminders/reminderlistview.dart';
import '../widgets/reminders/Remindertitle.dart';
//import '../widgets/reminders/bodystate.dart';

class _ViewReminders extends State<ViewReminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reminders '),
        backgroundColor: const Color(0xff68b2a0),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            Remindertitle(),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            new SingleChildScrollView(
              child: ReminderListview(),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewReminders extends StatefulWidget {
  @override
  _ViewReminders createState() => _ViewReminders();
}
