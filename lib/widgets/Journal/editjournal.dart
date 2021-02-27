import 'package:flutter/material.dart';
import 'package:project_mobile/Screens/viewjournals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = Firestore.instance;

class Diaries {
  final text;
  final title;
  final diaryid;
  final timestamp;
  final DocumentReference reference;

  Diaries({
    this.text,
    this.title,
    this.diaryid,
    this.timestamp,
    this.reference,
  });

  Diaries.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['text'] != null),
        assert(map['title'] != null),
        assert(map['timestamp'] != null),
        text = map['text'],
        title = map['title'],
        diaryid = map['diaryid'],
        timestamp = date;
  Diaries.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$text:$title:$diaryid>";
}

class EditJournal extends StatefulWidget {
  @override
  EditJournalState createState() {
    return EditJournalState();
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

Future<void> editStudent(textcontroller, titlecontroller) async {
  var specificDiary = await Firestore.instance
      .collection('Diaries')
      .document(titlecontroller.text);
  specificDiary.get();
  await db.collection("Diaries").document(titlecontroller.text).updateData({
    'text': textcontroller.text,
    'title': titlecontroller.text,
    'timestamp': date
  });
}

class EditJournalState extends State<EditJournal> {
  Future<bool> UpdateJournal(textcontroller, titlecontroller) async {
    print("updating journal");
    print(textcontroller.text);
    CollectionReference diaries = Firestore.instance.collection('Diaries');

    Future<void> UpdateJournal() {
      return diaries
          .document(titlecontroller.text)
          .updateData({
            'title': titlecontroller.text,
            'text': textcontroller.text,
            'timestamp': date
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }
  }

  final textcontroller = TextEditingController();
  final titlecontroller = TextEditingController();

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Diaries').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    print(data.documentID);
    print(data);
    final diary = Diaries.fromSnapshot(data);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(30, 20, 30, 0)),
          Container(
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
              controller: titlecontroller,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                  labelText: diary.title,
                  labelStyle: TextStyle(color: Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
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
                controller: textcontroller,
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    labelText: diary.text,
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(21.0),
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
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
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              gradient: RadialGradient(
                center: Alignment(-0.88, -1.0),
                radius: 1.35,
                colors: [const Color(0xff7be495), const Color(0xff329d9c)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x36329d9c),
                  offset: Offset(15, 15),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.

                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    editStudent(textcontroller, titlecontroller);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewJournals()),
                  );
                },
                child: Text('Update'),
              ),
            ),
          )
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
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
        child: _buildBody(context),
      ),
    ));
  }
}
