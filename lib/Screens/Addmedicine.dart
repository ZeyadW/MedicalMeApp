import 'package:date_field/date_field.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../models/reminder.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'viewreminders.dart';

class Addmedicine extends StatefulWidget {
  @override
  _AddmedicineState createState() => _AddmedicineState();
}

class _AddmedicineState extends State<Addmedicine> {
  Reminder r = new Reminder();
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _remindersTxtController = TextEditingController();
  final myController = TextEditingController();
  List hrstable;
  DateTime v;
  final hrController = TextEditingController();
  final calendarcont = DateRangePickerController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  dynamic daysarray;
  DateTime cStrt;
  DateTime cEnd;

  Future<bool> createReminder(textcontroller) async {
    String rname = _remindersTxtController.text;
    print("Name:$rname,\n Type:$_rtypeItem \n days:$daysarray");
    _db.collection('reminders').add({
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

  List<ListItem> _dropdownItems = [
    ListItem(1, "Medicine"),
    ListItem(2, "Syringe"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _rtypeItem;
  var tn;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Reminder'),
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            Center(
              child: Text(
                'New Reminder',
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 13,
                  color: const Color(0xff205072),
                  height: 1.3846153846153846,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'Enter your reminder details',
                style: TextStyle(
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 10,
                  color: const Color(0xff68b2a0),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _dropdownbox(context),
            Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
              ),
              child: TextFormField(
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
                      controller: myController,
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
                      int mc = int.parse(myController.text);
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
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select a duration';
                                        }
                                        return null;
                                      },
                                      onDateSelected: (DateTime value) {
                                        v = value;
                                        print(i - 1); //1,2

                                        print(v);
                                        hrstable[i - 1] = v;
                                        print(hrstable);
                                      },
                                    ),
                                  ),
                                  FlatButton(
                                    child: Text('next'),
                                    onPressed: () async {
                                      if (hrstable.isNotEmpty)
                                        Navigator.of(ctx).pop();
                                      return 'Please select a duration';
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
            _daypicker(context),
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
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
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
                  if (cStrt == null && cEnd == null) {
                    //grab bara el for loop el zar2a
                    cStrt = DateTime.now();
                    cEnd = DateTime.now().add(Duration(days: 2));
                  }

                  if (cStrt != null && cEnd == null) {
                    //grab bara el for loop el zar2a
                    cStrt = cStrt;
                    cEnd = cStrt.add(Duration(days: 3));
                  }
                  r.createReminder(_remindersTxtController, _rtypeItem,
                      daysarray, cStrt, cEnd, hrstable);
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

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _rtypeItem = _dropdownMenuItems[0].value;
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
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
