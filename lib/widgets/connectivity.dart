import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/welcomescreen%20(1).dart';
/*
class Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Routing & Navigation"),
        ),
        body: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (BuildContext ctxt,
                AsyncSnapshot<ConnectivityResult> snapShot) {
              if (!snapShot.hasData) return CircularProgressIndicator();
              var result = snapShot.data;
              switch (result) {
                case ConnectivityResult.none:
                  print("no net");
                  return Center(child: Text("No Internet Connection!"));
                case ConnectivityResult.mobile:
                case ConnectivityResult.wifi:
                  print("yes net");
                  return Center(
                    child: Text('Welcome to home Page'),
                  );
                default:
                  return Center(child: Text("No Internet Connection!"));
              }
            }));
  }
}*/

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
      body: isInternetOn ? WelcomeScreen() : buildAlertDialog(),
      /* body: isInternetOn
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
