import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/welcomescreen%20(1).dart';
import '../widgets/profile/editprofilebutton.dart';
import '../widgets/profile/emergencycontactsbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color(0xff68b2a0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                'My Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90.0),
                color: Colors.green[100],
              ),
            ),
            Editprofilebutton(),
            Emergencycontactsbutton(),
            Container(
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
                  logout();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => WelcomeScreen()));
                },
                child: Text(
                  "Log Out",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<Null> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', null);
  prefs.setString('email', null);
  prefs.setBool('isLoggedIn', false);
}
