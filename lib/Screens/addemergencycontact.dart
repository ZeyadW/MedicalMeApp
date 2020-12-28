import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_mobile/Home.dart';
import 'package:project_mobile/Screens/Signup.dart';
import 'emergencycontact.dart';
import '../widgets/Addemergencycontact/AddemergencycontactForm.dart';

class Addemergencycontact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var Row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
    var Row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter your emergency contact details',
          style: TextStyle(
              fontSize: 15, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff68b2a0),
        title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[Row1, Row2, AddemergencycontactForm()],
        ),
      ))),
    );
  }
}
