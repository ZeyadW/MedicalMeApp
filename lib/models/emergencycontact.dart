import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmergencyContact {
  String name;
  String number;
  DocumentReference reference;

  EmergencyContact({name, number}) {
    this.name = name;
    this.number = number;
  }

  EmergencyContact.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['phone'] != null),
        name = map['name'],
        number = map['phone'];
  EmergencyContact.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Future<bool> addcontact(phonecontroller, namecontroller) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    await Firestore.instance
        .collection("Users")
        .doc(email)
        .collection('Diary')
        .doc(phonecontroller.text)
        .set({
      'name': namecontroller.text,
      'phone': phonecontroller.text,
    });
    return true;
  }
}
