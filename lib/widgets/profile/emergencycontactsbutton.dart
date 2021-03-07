import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/emergencycontact.dart';
import 'package:project_mobile/widgets/Addemergencycontact/AddemergencycontactForm.dart';
import 'package:project_mobile/widgets/emergencycontact/emergency_contacts.dart';
import 'package:provider/provider.dart';
import 'package:project_mobile/models/contactprovider.dart';

class Emergencycontactsbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        gradient: RadialGradient(
          center: Alignment(-0.88, -1.0),
          radius: 1.35,
          colors: [const Color(0xff7be495), const Color(0xff329d9c)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x36329d9c),
            offset: Offset(15, 15),
            blurRadius: 40,
          ),
        ],
      ),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewEmergencyContactscreen()),
          );
        },
        child: Text(
          "Emergency Contact",
        ),
      ),
    );
  }
}
