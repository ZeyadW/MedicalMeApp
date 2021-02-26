import 'package:flutter/material.dart';
import '../widgets/Journal/journalform.dart';
import '../widgets/Journal/textjournal.dart';

class Journal extends StatefulWidget {
  @override
  _Journal createState() => _Journal();
}

class _Journal extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal '),
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            JournalForm(),
          ])),
        ),
      ),
    );
  }
}
