import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/emergencycontact.dart';
import 'package:project_mobile/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class AddemergencycontactForm extends StatefulWidget {
  @override
  AddemergencycontactFormState createState() {
    return AddemergencycontactFormState();
  }
}

class AddemergencycontactFormState extends State<AddemergencycontactForm> {
  FocusNode myFocusNode;
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  var _passwordVisible;
  var email;
  var check;
  EmergencyContact ec = new EmergencyContact();
  Future<bool> checkadd() async {
    check = await ec.addcontact(phonecontroller, namecontroller);
    print("in check add emergency ");
    if (check) {
      print("in check trueee ");
      return true;
    } else {
      print("in check falseeeeeeeeeee ");
      return false;
    }
  }

  Future<void> www() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
  }

  @override
  void initState() {
    www();
    _passwordVisible = true;
    super.initState();
    myFocusNode = FocusNode();
  }

  final _formKey = GlobalKey<FormState>();
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => ViewEmergencyContactscreen()));
      },
    );
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
            child: TextFormField(
              controller: namecontroller,
              autofocus: true,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Enter your emergency contact\'s name',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a name';
                }
                if (!value.contains(validCharacters)) {
                  return 'Please enter the correct format';
                }

                return null;
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
            child: TextFormField(
              controller: phonecontroller,
              autofocus: true,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_call),
                  labelText: 'Enter your emergency contact\'s number',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a number';
                }
                if (!value.contains(validCharacters)) {
                  return 'Please enter the correct format';
                }

                return null;
              },
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
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
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () async {
                  print("pressed button");
                  if (_formKey.currentState.validate()) {
                    print("form validated");
                    var add = await checkadd();
                    print(add);
                    if (add == true) {
                      print("addddd truee before dialog");
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content:
                                Text("Emergency Contact added successfully"),
                            actions: [okButton],
                          );
                        },
                      );

                      // If the form is valid, display a Snackbar.

                    }
                  }
                },
                child: Text('Add Emergency Contact'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
