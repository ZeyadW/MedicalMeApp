import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String username;
  String password;
  String emergencycontact;
  String date;
  String email;
  String imagepath;
  String emergencycontactname;
  List<EmergencyContact> emergencyContacts;
  User(
      {this.username,
      this.password,
      this.emergencycontact,
      this.date,
      this.email,
      this.imagepath,
      this.emergencycontactname});

  String getusername() {
    return username;
  }

  Future<String> getEmail() {
    return Future.value(email);
  }
}

class Users {
  User signup(
      username, password, emergency, date, email, emergencycontactname) {
    adduser(username, password, emergency, date, email, emergencycontactname);
    User rr = User(
        username: username,
        password: password,
        date: date,
        email: email,
        emergencycontactname: emergencycontactname);
    return rr;
  }

  Future<User> adduser(
      username, password, emergency, date, email, emergencycontactname) async {
    await Firestore.instance.collection("Users").document(email).setData({
      'emergencyphone': emergency,
      'emergencyname': emergencycontactname,
      'birthdate': date,
      'password': password,
      'username': username,
    }); //setData take a map as input

    User u = new User(
        username: username,
        password: password,
        emergencycontact: emergency,
        date: date,
        email: email,
        emergencycontactname: emergencycontactname);
    //myusers.add(u);
    return u;
  }

  String username;
  Future<bool> login1(email, password) async {
    //CollectionReference users = FirebaseFirestore.instance.collection('Users');
    DocumentSnapshot variable =
        await Firestore.instance.collection('Users').document(email).get();

    if (variable.data() == null) {
      // Future.delayed(Duration(seconds: 100), () => false);
      return false;
    } else {
      //print("not null in login 1");
      var passworduser = variable.get("password");
      if (passworduser == password) {
        print("variable.get(username");
        print(variable.get("username"));
        this.username = variable.get("username");

        print("correct password in log in ");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', this.username);
        prefs.setString('email', email);
        prefs.setBool('isLoggedIn', true);
        print("username");
        print(prefs.getString("username"));
        print("isloged o]inn");
        print(prefs.getBool("isLoggedIn"));
        return true;
      } else {
        //print("variable.data().containsValue(password)");
        //print(variable.data().containsValue(password));
        //print("passwordd");
        //print(password);
        print("wrong password in log in ");
        return false;
        //return Future<bool>.value(false);
      }
    }
  }

  Future<User> validatelogin(email, password) async {
    var log1 = await login1(email, password);
    // Future<Widget> log2 = login2(email, password);
    //print("ba3d await  in validate ");
    //print(log1.toString());
    //print("ba3d to string (log1) in validate ");
    //print(log1);
    //Future<bool> log = await  waitting(log1);
    // Future.delayed(Duration(seconds: 100), () => log1);
    if (log1) {
      User u = User(email: email, username: this.username);
      // print(u.toString());
      //print(u.email);
      //print("log1 === true");
      return u;
    } else {
      // print("log1   falseeee");
      return null;
    }
  }
}
