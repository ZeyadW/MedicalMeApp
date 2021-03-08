import 'package:date_field/date_field.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/viewreminders.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'viewreminders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/models/reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewReminder extends StatefulWidget {
  Reminder r = new Reminder();
  ViewReminder(r) {
    this.r = r;
  }
  @override
  _ViewReminderState createState() => _ViewReminderState(this.r);
}

class _ViewReminderState extends State<ViewReminder> {
  Reminder reminder = new Reminder(); //= d.Diaries();
  TextEditingController _remindersTxtController;

  TextEditingController hrController;
  _ViewReminderState(this.reminder) {
    _remindersTxtController =
        TextEditingController(text: reminder.remindername);
    hrController = TextEditingController(text: reminder.times.toString());
  }
  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);

    if (reminder.type == _dropdownMenuItems[0].value.name)
      _rtypeItem = _dropdownMenuItems[0].value;
    if (reminder.type == _dropdownMenuItems[1].value.name)
      _rtypeItem = _dropdownMenuItems[1].value;

    setEmail(); // calls getconnect method to check which type if connection it
  }

  var email;
  Future<bool> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setState(() {
      email = prefs.getString('email');
    });
    return true;
  }

  final _formKey = GlobalKey<FormState>();

  List hrstable;

  DateTime v;

  final calendarcont = DateRangePickerController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  dynamic daysarray;
  DateTime cStrt;
  DateTime cEnd;

  Future<bool> createReminder(DocumentSnapshot snap) async {
    String rname = _remindersTxtController.text;
    print("Name:$rname,\n Type:$_rtypeItem \n days:$daysarray");
    _db.collection('reminders').add({
      "name": rname,
      "type": _rtypeItem.name,
      "days": daysarray,
      "courseStart": cStrt,
      "courseEnd": cEnd,
      "timesperday": hrstable.length,
      "hourstable": hrstable,
    });
    return true;
  }

  Future<bool> updatereminder(reminder, _remindersTxtController, _rtypeItem,
      daysarray, cStrt, cEnd, hrController) async {
    print(email);
    print('hamada' + _remindersTxtController);
    await _db
        .collection("Users")
        .doc(email)
        .collection("Reminders")
        .doc(_remindersTxtController.text)
        .update({
      "name": _remindersTxtController.text,
      "type": _rtypeItem.name,
      "courseStart": cStrt,
      "courseEnd": cEnd,
      "timesperday": int.parse(hrController.text),
      "hourstable": reminder.hrstable,
    });
    return true;
  }

  List<ListItem> _dropdownItems = [
    ListItem(1, "Medicine"),
    ListItem(2, "Syringe"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  var _rtypeItem;
  var tn;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Reminder'),
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            _dropdownbox(context),
            Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
              ),
              child: TextFormField(
                readOnly: true,
                controller: _remindersTxtController,
                autofocus: true,
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.tab_outlined),
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(21.0),
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      readOnly: true,
                      controller: hrController,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      style: TextStyle(color: Colors.green),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.tab_outlined),
                          labelText: 'Times per day',
                          labelStyle: TextStyle(color: Colors.green),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(21.0),
                          )),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text('Set Time'),
                    onPressed: () async {
                      int mc = int.parse(hrController.text);
                      hrstable = new List(mc);

                      for (var i = mc; i > 0; i--) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return SimpleDialog(
                                title: Text("Set Time"),
                                children: <Widget>[
                                  Container(
                                    child: DateTimeFormField(
                                      initialValue:
                                          reminder.hrstable[i - 1].toDate(),
                                      decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.black45),
                                        errorStyle:
                                            TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.event_note),
                                        labelText: 'Course Duration',
                                      ),
                                      mode: DateTimeFieldPickerMode.time,
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (e) => (e?.day ?? 0) == null
                                          ? 'choose an aproprite date.'
                                          : null,
                                      onDateSelected: (DateTime value) {
                                        v = value;
                                        print(i - 1); //1,2

                                        print("zeyad $v");
                                        reminder.hrstable[i - 1] = v;
                                        print(hrstable);
                                      },
                                    ),
                                  ),
                                  FlatButton(
                                    child: Text('next'),
                                    onPressed: () async {
                                      Navigator.of(ctx).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _daysbox(context),
                FlatButton(
                  child: Text('Change Days'),
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return SimpleDialog(
                            title: Text("Set Time"),
                            children: <Widget>[
                              Container(
                                child: _daypicker(context),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: FlatButton(
                                      child: Text('Cancel'),
                                      onPressed: () async {
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: FlatButton(
                                      child: Text(
                                        'Confirm',
                                        textAlign: TextAlign.center,
                                      ),
                                      onPressed: () async {
                                        reminder.updatedays(
                                            this.reminder, daysarray);
                                        setState(() {
                                          reminder.days = daysarray;
                                        });
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                ),
              ],
            ),
            Container(
                margin:
                    new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: const Color(0xffffffff),
                ),
                child: SfDateRangePicker(
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      final DateTime rangeStartDate = args.value.startDate;
                      final DateTime rangeEndDate = args.value.endDate;

                      cStrt = rangeStartDate;
                      cEnd = rangeEndDate;
                    }
                  },
                  controller: calendarcont,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      reminder.courseStrt.toDate(),
                      reminder.courseEnd.toDate()),
                )),
            Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                gradient: RadialGradient(
                  center: Alignment(-0.88, -1.0),
                  radius: 1.35,
                  colors: [const Color(0xff7be495), const Color(0xff329d9c)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: FlatButton(
                child: Text('Save'),
                onPressed: () async {
                  if (cStrt == null || cEnd == null) {
                    //grab bara el for loop el zar2a
                    cStrt = reminder.courseStrt.toDate();
                    cEnd = reminder.courseEnd.toDate();
                  }
                  print(hrstable);
                  print(int.parse(hrController.text));
                  reminder.updatereminder(
                      this.reminder,
                      _remindersTxtController,
                      _rtypeItem,
                      daysarray,
                      cStrt,
                      cEnd,
                      hrController);
                  // if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewReminders()),
                  );
                },
              ),
            )
          ])),
        ),
      ),
    );
  }

  Widget _daypicker(BuildContext context) {
    daysarray = reminder.days;
    print(daysarray);
    return SelectWeekDays(
      border: false,
      backgroundColor: Colors.white,
      daysFillColor: Color(0xff68b2a0),
      unSelectedDayTextColor: Colors.black,
      selectedDayTextColor: Colors.white,
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [Colors.white, Colors.white],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      onSelect: (rdays) {
        daysarray = rdays;
        // <== Callback to handle the selected days
        print(rdays);
      },
    );
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: TextStyle(
              fontFamily: 'Montserrat-Bold',
              fontSize: 15,
              color: const Color(0xff68b2a0),
              height: 1.1333333333333333,
            ),
            textAlign: TextAlign.left,
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget _dropdownbox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffffffff),
            border: Border.all(color: Colors.green)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
              value: _rtypeItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _rtypeItem = value;
                });
              }),
        ),
      ),
    );
  }

  Widget _daysbox(BuildContext context) {
    List<Widget> list = new List();
    Widget cb;

    for (int i = 0; i < reminder.days.length; i++) {
      print(reminder.days.length);
      cb = Container(
          width: 60,
          height: 60,
          child: Center(
            child: Text(
              reminder.days[i],
              style: TextStyle(
                fontFamily: 'Montserrat-Bold',
                fontSize: 13,
                color: Colors.green,
                height: 1.3846153846153846,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ));
      list.add(cb);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
