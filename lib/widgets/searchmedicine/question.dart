import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 385.0,
        height: 475.0,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x21329d9c),
                      offset: Offset(0, 13),
                      blurRadius: 34,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text("Medicine $index"),
                ),
              ),
            );
          },
        ));
  }
}
