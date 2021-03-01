import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/Screens/editjournal.dart';
import 'package:project_mobile/models/diaries.dart' as d;

class ListAllJournals extends StatefulWidget {
  @override
  _ListAllJournalState createState() {
    return _ListAllJournalState();
  }
}

class _ListAllJournalState extends State<ListAllJournals> {
  var diary = new d.Diaries();
  Future<bool> deletediary(d.Diaries diary) async {
    //print(record.title);
    await Firestore.instance
        .collection('Diaries')
        .document(diary.text)
        .delete();
    print(diary.title);

    print("deleting diary");
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
    final diary = d.Diaries.fromSnapshot(data);

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
              print("hamadaaa");
              print(diary.title);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditJournalM(diary)),
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
