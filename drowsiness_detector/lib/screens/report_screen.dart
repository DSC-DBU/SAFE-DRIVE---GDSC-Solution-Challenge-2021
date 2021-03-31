import 'package:drowsiness_detector/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportTiles extends StatefulWidget {
  static const id = 'report_screen';
  @override
  _ReportTilesState createState() => _ReportTilesState();
}

class _ReportTilesState extends State<ReportTiles> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Active Reports'),
          backgroundColor: kOrangeColor.shade400,
        ),
        body: ReportList(),
      ),
    );
  }
}

class ReportList extends StatefulWidget {
  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  final user = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('timestamps')
            .where('uid', isEqualTo: user)
            .orderBy("time", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No Active Records',
                style: kButtonTextStyle,
              ),
            );
          }
          else {
            return ListView(
              children: snapshot.data.docs.map((docs) {
                return Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.25,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: kOrangeColor.shade400,
                      borderRadius: BorderRadius.circular(13),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Drowsiness Detected',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(docs['time'], style: kButtonTextStyle),
                            SizedBox(width: 45),
                            Text(docs['date'], style: kButtonTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    ]);
  }
}
