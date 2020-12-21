import 'package:flutter/material.dart';

class listalljournals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                leading: Image(image: AssetImage('images/journl.jpeg')),
                title: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                    child: FlatButton(
                      child: Text('hamada'),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                    child: Text(
                      'added 2 months ago',
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
    ));
  }
}
