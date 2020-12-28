import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'searchmedicine.dart';
import '../Addmedicine.dart';
import '../widgets/reminders/reminderlistview.dart';
import '../widgets/reminders/Remindertitle.dart';
import '../widgets/reminders/bodystate.dart';

class ViewReminders extends StatelessWidget {
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
            BodyState(),
            Center(
                child: new SingleChildScrollView(
              child: ReminderListview(),
            )),
          ],
        ),
      ),
    );
  }
}
