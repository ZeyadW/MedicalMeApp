import 'package:flutter/material.dart';

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

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '\n\n  Search FAQ:',
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
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
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
