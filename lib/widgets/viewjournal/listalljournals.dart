import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/widgets/Journal/editjournal.dart';
import 'package:project_mobile/Screens/editjournal.dart';

class ListAllJournals extends StatefulWidget {
  @override
  _listAllJournalState createState() {
    return _listAllJournalState();
  }
}

class _listAllJournalState extends State<ListAllJournals> {
  var diary = new Diaries();
  Future<bool> deletediary(Diaries diary) async {
    //print(record.title);
    await Firestore.instance
        .collection('Diaries')
        .document(diary.text)
        .delete();
    print(diary.title);

    print("deleting diary");
    return true;
  }

  Future<bool> updatediary() async {
    await Firestore.instance
        .collection('Diaries')
        .document(diary.text)
        .updateData({
      'title': "title",
      'text': "text",
      'timestamp': "timestamp",
    });

    return true;
  }

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

    return Center(
        child: new SingleChildScrollView(
            child: Container(
                child: ListTile(
      leading: Image(image: AssetImage('images/journl.jpeg')),
      title: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
          child: FlatButton(
            child: Text(diary.title),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditJournalM()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 190, 0),
          child: Text(
            diary.timestamp.toString(),
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    ))));
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

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
