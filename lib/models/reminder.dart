import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reminder {
  String remindername;
  String type;
  List days;
  List hrstable;
  var courseStrt;
  var courseEnd;
  int times;
  var rid;
  var datecreated;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var email;
  DocumentReference reference;
  Reminder({
    this.remindername,
    this.type,
    this.days,
    this.hrstable,
    this.courseStrt,
    this.courseEnd,
    this.times,
    this.datecreated,
  });

  Reminder.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['type'] != null),
        assert(map['timesperday'] != null),
        assert(map['hourstable'] != null),
        assert(map['days'] != null),
        assert(map['courseStart'] != null),
        assert(map['courseEnd'] != null),
        assert(map['datecreated'] != null),
        remindername = map['name'],
        type = map['type'],
        times = map['timesperday'],
        hrstable = map['hourstable'],
        courseStrt = map['courseStart'],
        courseEnd = map['courseEnd'],
        days = map['days'],
        datecreated = map['datecreated'];

  Reminder.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$remindername:$type:$rid>";

  String getrname() {
    return remindername;
  }

  Future<bool> createReminder(_remindersTxtController, _rtypeItem, daysarray,
      cStrt, cEnd, hrstable) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    String rname = _remindersTxtController.text;
    //print("Name:$rname,\n Type:$_rtypeItem \n days:$daysarray");
    await _db
        .collection('Users')
        .doc(email)
        .collection('Reminders')
        .doc(rname)
        .set({
      "name": rname,
      "datecreated": DateTime.now(),
      "type": _rtypeItem.name,
      "days": daysarray,
      "courseStart": cStrt,
      "courseEnd": cEnd,
      "timesperday": hrstable.length,
      "hourstable": hrstable,
    });
    return true;
  }

  Future<bool> deletereminder(DocumentSnapshot snap, rname) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await _db
        .collection("Users")
        .doc(email)
        .collection("Reminders")
        .doc(rname)
        .delete();
    return true;
  }

  void updatedays(reminder, daysarray) {
    _db
        .collection("Users")
        .doc(email)
        .collection("Reminders")
        .doc(remindername)
        .update({
      "days": daysarray,
    });
  }

  Future<bool> updatereminder(reminder, _remindersTxtController, _rtypeItem,
      daysarray, cStrt, cEnd, hrController) async {
    // print("hey");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await _db
        .collection("Users")
        .doc(email)
        .collection("Reminders")
        .doc(remindername)
        .update({
      "name": _remindersTxtController.text,
      "type": _rtypeItem.name,
      "courseStart": cStrt,
      "courseEnd": cEnd,
      "timesperday": int.parse(hrController.text),
      "hourstable": reminder.hrstable,
      "days": daysarray
    });
    return true;
  }
}
