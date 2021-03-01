import 'package:flutter/material.dart';
import 'package:project_mobile/models/users.dart';
import 'package:project_mobile/Screens/Login.dart';
import 'package:project_mobile/Home.dart';
import 'package:project_mobile/Service/FlutterFireauth.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  FocusNode myFocusNode;
  var _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    myFocusNode = FocusNode();
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  static final validCharactersPassword = RegExp(r'^[a-zA-Z0-9_\-=@\.;]+$');
  Users users = new Users();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool checkuserexist() {
    User u = users.validatelogin(emailcontroller.text, passwordcontroller.text);
    print("jhrjrrjrjrjrjjr");
    print(u.email);
    if (u != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => HomePage.ut(
                u: users.validatelogin(
                    emailcontroller.text, passwordcontroller.text))));
      },
    );

    Widget okButton2 = FlatButton(
      child: Text(
        "login again",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (context) => LoginPage()));
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
                controller: emailcontroller,
                autofocus: true,
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Enter your Email',
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
                  if (!value.contains('@')) {
                    return 'Please enter the correct email format';
                  }
                }),
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
              focusNode: myFocusNode,
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
                  labelText: 'Enter your password',
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
                ;
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
                  bool shouldNavigate = await signIn(
                      emailcontroller.text, passwordcontroller.text);
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    bool p = checkuserexist();
                    print("check exist ");
                    print(p);
                    print(" shouldNavigate ");
                    print(shouldNavigate);
                    if (checkuserexist() == true && shouldNavigate) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Logged in successfully"),
                            actions: [okButton],
                          );
                        },
                      );
                    } else {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("wrong username or password"),
                            actions: [okButton2],
                          );
                        },
                      );
                    }
                    // If the form is valid, display a Snackbar.

                  }
                },
                child: Text('Login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
