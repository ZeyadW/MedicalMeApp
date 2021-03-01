import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String password;
  String emergencycontact;
  String date;
  String email;
  String imagepath;
  String emergencycontactname;

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
}

class Users {
  List<User> myusers = [
    User(
        //0
        username: "zahwa",
        password: "123456z",
        emergencycontact: "01110864421",
        date: "date",
        email: "email"),
    User(
        //1
        username: "maria",
        password: "1234m",
        emergencycontact: "01110864421",
        date: "date",
        email: "email"),
    User(
        //2
        username: "zeyad",
        password: "1234zz",
        emergencycontact: "01110864421",
        date: "date",
        email: "email"),
    User(
        //3
        username: "khazbak",
        password: "1234k",
        emergencycontact: "01110864421",
        date: "date",
        email: "email"),
  ];

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

  bool login(email, password) {
    for (User user in myusers) {
      if (user.email == email) {
        if (user.password == password) {
          return true;
        }
      }
    }
    return false;
  }

  User validatelogin(email, password) {
    if (login(email, password)) {
      User u = new User(email: email);
      return u;
    } else {
      return null;
    }
  }
}
