import 'package:flutter/material.dart';

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

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '\n\n  Search for any medication:',
            style: TextStyle(
              fontFamily: 'Montserrat-Bold',
              fontSize: 21,
              color: const Color(0xff205072),
            ),
          ),
        ],
      ),
    );
  }
}

class BodyState extends StatelessWidget {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 12, 30, 12),
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
            child: TextFormField(
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  labelText: 'Search for your medications',
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
          ),
        ),
      ],
    );
  }
}

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
