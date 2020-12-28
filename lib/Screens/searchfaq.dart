import 'package:flutter/material.dart';
import '../widgets/q&awidgets/titletext.dart';
import '../widgets/q&awidgets/bodystate.dart';
import '../widgets/q&awidgets/questions.dart';

class SearchFaq extends StatefulWidget {
  @override
  _SearchFaqState createState() => _SearchFaqState();
}

class _SearchFaqState extends State<SearchFaq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ '),
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
