import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 385.0,
        height: 475.0,
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: const Color(0xff68b2a0),
                    ),
                    child: ListTile(
                      title: Text("Is the App Protecting Your Privacy? "),
                    ),
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.0),
                      color: const Color(0xffffffff),
                    ),
                    child: ListTile(
                      title: Text(
                          "Though doctors and hospitals must abide by the healthcare privacy law known as HIPAA.$index"),
                    ),
                  )
                ]),
              ),
            );
          },
        ));
  }
}
