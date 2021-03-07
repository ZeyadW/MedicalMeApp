import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/emergencycontact/emergency_contacts.dart';
import '../widgets/emergencycontact/addemergencycontactbutton.dart';
import 'package:provider/provider.dart';
import 'package:project_mobile/models/contactprovider.dart';

class ViewEmergencyContactscreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffe0ecde),
      appBar: AppBar(
        backgroundColor: const Color(0xff68b2a0),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Column(
        children: [
          Addemergencybutton(),
          // Listemergencycontacts(),
          //_buildListView(),
          Consumer<ContactProvider>(
              builder: (context, counter, child) => Listemergencycontacts())
        ],
      ),
    );
  }
}
