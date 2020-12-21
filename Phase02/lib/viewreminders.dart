import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'searchmedicine.dart';
import 'Addmedicine.dart';

class ViewReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reminders '),
        backgroundColor: const Color(0xff68b2a0),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: new SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 850,
              height: 30,
              color: const Color(0xffe0ecde),
              margin: EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 0.0, bottom: 0.0),
              child: Row(children: [
                Text(
                  'My Reminders:',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 60.0,
                    top: 10.0,
                    right: 0.0,
                    bottom: 0.0,
                  ),
                  child: FlatButton(
                    child: Text(
                      '+ Reminder',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Addmedicine()),
                      );
                    },
                  ),
                )
              ]),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            BodyState(),
            Center(
                child: new SingleChildScrollView(
              child: Container(
                  width: 385.1,
                  height: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34.0),
                      topRight: Radius.circular(34.0),
                      bottomRight: Radius.circular(34.0),
                      bottomLeft: Radius.circular(34.0),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading:
                            Image(image: AssetImage('images/Icons- pill.jpeg')),
                        title: Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 170, 0),
                            child: FlatButton(
                              child: Text('Take Medicine'),
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                            child: Text(
                              'in 3 hrs',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          )
                        ]),
                      );
                    },
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
