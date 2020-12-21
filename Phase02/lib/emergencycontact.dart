import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'addemergencycontact.dart';

class ViewEmergencyContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0ecde),
      appBar: AppBar(
        backgroundColor: const Color(0xff68b2a0),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Column(
        children: [
          Container(
            width: 850,
            height: 70,
            color: const Color(0xffe0ecde),
            margin:
                EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
            child: Row(children: [
              Text(
                'Emergency Contact:',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                  right: 0.0,
                  bottom: 0.0,
                ),
                child: FlatButton(
                  child: Text(
                    '+ Emergency Contact',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Addemergencycontact()),
                    );
                  },
                ),
              )
            ]),
          ),
          Center(
              child: new SingleChildScrollView(
            child: Container(
                width: 385.1,
                height: 475.2,
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
                      leading: Image(
                          image: AssetImage('images/Icons- ambulance.jpeg')),
                      title: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                          child: FlatButton(
                            child: Text('Zeyad'),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                          child: Text(
                            '01067191933',
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
    );
  }
}
