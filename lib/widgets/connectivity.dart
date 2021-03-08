//import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/Home.dart';
import 'package:project_mobile/Screens/welcomescreen%20(1).dart';
import 'package:shared_preferences/shared_preferences.dart';

/*

class HomeConnect extends StatefulWidget {
  @override
  _HomeConnectState createState() => _HomeConnectState();
}

class _HomeConnectState extends State<HomeConnect> {
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  @override
  void initState() {
    super.initState();

    getConnect(); // calls getconnect method to check which type if connection it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInternetOn ? AutoLogin() : buildAlertDialog(),
      /*  body: isInternetOn
          ? iswificonnected
              ? showWifi()
              : showMobile()
          : buildAlertDialog(),*/
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }

  Center showWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              " Your are connected to ${iswificonnected ? "WIFI" : "MOBILE DATA"}"),
          Text(iswificonnected ? "$wifiBSSID" : "Not Wifi"),
          Text("$wifiIP"),
          Text("$wifiName")
        ],
      ),
    );
  }

  Center showMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      iswificonnected = true;
    }
  }
}
*/
class AutoLogin extends StatefulWidget {
  @override
  _AutoLogin createState() => _AutoLogin();
}

class _AutoLogin extends State<AutoLogin> {
  TextEditingController nameController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';
  String email = '';

  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoggedIn
          ? WelcomeScreen()
          : HomePage.username(username: userId, email: email),
    );
  }

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.userId = prefs.getString('username');
    this.email = prefs.getString('email');
    this.isLoggedIn = prefs.getBool('isLoggedIn');
    print('autologin emai');
    print(email);
    if (userId != null) {
      setState(() {
        prefs.setBool('isLoggedIn', true);

        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setString('email', null);
    prefs.setBool('isLoggedIn', false);
    this.isLoggedIn = false;
    setState(() {
      name = '';
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);

    setState(() {
      name = nameController.text;
      isLoggedIn = true;
    });

    nameController.clear();
  }
}
