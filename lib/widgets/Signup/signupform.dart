import 'package:flutter/material.dart';

import 'package:project_mobile/Service/FlutterFireauth.dart';
import 'package:project_mobile/models/users.dart';

import '../../Home.dart';

const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final validatePhone = RegExp(pattern);

class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  var _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  static final validCharactersPassword =
      RegExp(r'^[a-zA-Z0-9_\-=@\.;{6,}]+$'); //{6,}
  static final validateDate = RegExp("[0-9/]");
  Users u = new Users();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emergencycontactnamecontroller = TextEditingController();
  final datecontroller = TextEditingController();
  final emergencycontactcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () async {
        bool shouldNavigate =
            await register(emailcontroller.text, passwordcontroller.text);
        print(shouldNavigate);
        print(usernamecontroller.text);
        if (shouldNavigate) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage.ut(
                      u: u.signup(
                          usernamecontroller.text,
                          passwordcontroller.text,
                          emergencycontactnamecontroller.text,
                          datecontroller.text,
                          emailcontroller.text,
                          emergencycontactcontroller.text))));
        }
        /*  Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => HomePage(
                u: u.signup(
                    usernamecontroller.text,
                    passwordcontroller.text,
                    emergencycontactnamecontroller.text,
                    datecontroller.text,
                    emailcontroller.text,
                    emergencycontactcontroller.text))));*/
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
              controller: usernamecontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Enter your Name',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
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
              controller: datecontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.date_range),
                  labelText: 'DD/MM/YY',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains(validateDate)) {
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
              controller: emergencycontactnamecontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Emergency Contact name',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
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
              controller: emergencycontactcontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_alert),
                  labelText: 'Emergency Contact Number',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains(validatePhone)) {
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
              controller: emailcontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains('.')) {
                  return 'Please enter the correct email format';
                }
                return value.contains('@')
                    ? null
                    : 'Please enter the correct email format';
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
              controller: passwordcontroller,
              obscureText: !_passwordVisible,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains(validCharactersPassword)) {
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
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.

                  if (_formKey.currentState.validate()) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Account created successfully"),
                          actions: [okButton],
                        );
                      },
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
