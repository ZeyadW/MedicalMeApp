import 'package:flutter/material.dart';

import 'package:project_mobile/widgets/Journal/editjournal.dart';

class EditJournalM extends StatefulWidget {
  @override
  _EditJournal createState() => _EditJournal();
}

class _EditJournal extends State<EditJournalM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Journal '),
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            EditJournal(),
          ])),
        ),
      ),
    );
  }
}
