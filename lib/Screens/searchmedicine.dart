import 'package:flutter/material.dart';
import '../widgets/searchmedicine/Bodystate.dart';
import '../widgets/searchmedicine/question.dart';
import '../widgets/searchmedicine/titletext.dart';

class SearchMed extends StatefulWidget {
  @override
  _SearchMedState createState() => _SearchMedState();
}

class _SearchMedState extends State<SearchMed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search '),
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
      body: SafeArea(
        child: Container(
            child: new SingleChildScrollView(
          child: Column(children: [
            TitleText(),
            BodyState(),
            Questions(),
          ]),
        )),
      ),
    );
  }
}
