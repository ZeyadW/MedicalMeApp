import 'package:flutter/material.dart';
import 'package:project_mobile/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Listemergencycontacts extends StatefulWidget {
  @override
  _Listemergencycontacts createState() {
    return _Listemergencycontacts();
  }
}

class _Listemergencycontacts extends State<Listemergencycontacts> {
  //EmergencyContact kk = new EmergencyContact();
  var email;
  Future<void> www() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
  }

  void initState() {
    super.initState();
    www();
  }

  Widget _buildBody(BuildContext context, email) {
    print("build body");
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(email)
          .collection('EmergecyContacts')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print("empty snapshot");
          return LinearProgressIndicator();
        }
        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    print(data.data());
    print("o0000");
    final emergencyContact = EmergencyContact.fromSnapshot(data);

    return Center(
        child: new SingleChildScrollView(
            child: Container(
                child: ListTile(
      leading: Image(image: AssetImage('images/Icons- ambulance.jpeg')),
      trailing: IconButton(
        onPressed: () {
          //    deleteDiary(diary);
        },
        icon: Icon(Icons.delete),
        color: Colors.red,
      ),
      title: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
          child: FlatButton(
            child: Text(emergencyContact.name),
            onPressed: () {
              /*Navigator.push(
                context,
               // MaterialPageRoute(builder: (context) => EditJournalM(diary)),
              );*/
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: Text(
            emergencyContact.number,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: new SingleChildScrollView(
      child: Container(
        width: 385.1,
        height: 475.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          color: Colors.white,
        ),
        child: _buildBody(context, email),
        /* child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    Image(image: AssetImage('images/Icons- ambulance.jpeg')),
                title: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                    child: FlatButton(
                      child: Text('Zeyad'),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                    child: Text(
                      '01067191933',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ]),
              );
            },
          )*/
      ),
    ));
  }
}
