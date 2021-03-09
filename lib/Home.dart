import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_mobile/Screens/viewjournals.dart';
import 'Screens/viewjournals.dart';
import 'Screens/contactus.dart';
import 'Screens/profile.dart';
import 'models/users.dart';
import 'Screens/viewreminders.dart';
//import 'Screens/viewjournals.dart';
import 'Screens/searchfaq.dart';
//import 'package:project_mobile/widgets/viewjournal/listalljournals.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  // String username = "";
  // Future<User> user;
  User u = new User();
  HomePage.username({String username, String email, var phone}) {
    this.u.username = username;
    this.u.email = email;
    this.u.emergencycontact = phone;
  }
  HomePage.ut({this.u});
  // HomePage.ul({this.user});
  HomePage();
  @override
  Widget build(BuildContext context) {
    print(u.emergencycontact);
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
                width: 385.1,
                height: 250.2,
                decoration: BoxDecoration(
                  /*image: new DecorationImage(
                    image: new AssetImage("images/Avatar 3.png"),
                  ),*/
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(34.0),
                    bottomLeft: Radius.circular(34.0),
                  ),
                  color: const Color(0xffe0ecde),
                ),
                padding: new EdgeInsets.only(top: 30),
                child: Text(
                  '      Hello ${u.username}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))),
        Padding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage('images/Icons- brain.png')),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        FlatButton(
          child: Text(
            'Reminders',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewReminders()),
            );
          },
        ),
      ],
    );
    var row3 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 5.0)),
        Image(image: AssetImage('images/Icons- path.png')),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        FlatButton(
          child: Text(
            'Journals',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewJournals()),
            );
          },
        ),
      ],
    );

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text('Home'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage.ut(u: this.u)),
                      )),
              ListTile(
                  title: Text('Profile'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      )),
              ListTile(
                  title: Text('FAQ'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchFaq()),
                      )),
              ListTile(
                  title: Text('Contact Us'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      )),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Text('Home Page'),
              Container(
                margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x36329d9c),
                        offset: Offset(15, 15),
                        blurRadius: 40,
                        spreadRadius: 20),
                  ],
                ),
                child: FlatButton(
                  child: Text(
                    'SOS',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onPressed: () {
                    launch("tel://${u.emergencycontact}");
                  },
                ),
              )
            ],
          ),
          backgroundColor: const Color(0xff68b2a0),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
        ),
        body: Center(
            child: Container(
          child: ListView(
              children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: row1,
              ),
              Divider(),
              ListTile(
                title: row2,
              ),
              ListTile(
                title: row3,
              ),
              Divider(),
            ],
          ).toList()),
        )));
  }
}
