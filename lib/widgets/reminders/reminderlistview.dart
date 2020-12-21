import 'package:flutter/material.dart';

class ReminderListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              leading: Image(image: AssetImage('images/Icons- pill.jpeg')),
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
        ));
  }
}
