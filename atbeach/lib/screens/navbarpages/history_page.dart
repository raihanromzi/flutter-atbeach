import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:atbeach/model/history_model.dart';
import 'package:atbeach/widget/app_color_theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  String username = '';
  String uid = '';

  // @override
  // void initState() async {
  //   super.initState();
  //   final firebaseUser = await FirebaseAuth.instance.currentUser;
  //   if (firebaseUser != null) {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(firebaseUser.uid)
  //         .get()
  //         .then((ds) {
  //       username = ds.data()?['username'];
  //       uid = ds.data()?['uid'];
  //     });
  //     print(username);
  //     // print(uid);
  //   }
  //   // print(firebaseUser?.uid);
  // }

  // filter() async {
  //   // HistoryModel historyModel = HistoryModel();
  //   final firebaseUser = await FirebaseAuth.instance.currentUser;
  //   if (firebaseUser != null) {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(firebaseUser.uid)
  //         .get()
  //         .then((ds) {
  //       username = ds.data()?['username'];
  //       uid = ds.data()?['uid'];
  //     });
  //     print(username);
  //     print(uid);
  //     print(firebaseUser.uid);
  //   }
  //   final results = await firestore
  //       .collection("history")
  //       .where("userID", isEqualTo: firebaseUser?.uid)
  //       .get();
  //   print(results.docs.length);
  //   print(uid);
  //   if (results.docs.isNotEmpty) {
  //     print('Total data filter: ${results.docs.length}');
  //     results.docs.forEach((element) {
  //       var data = element.data();

  //       print(data);
  //     });
  //   } else {
  //     print('No data found');
  //   }
  // }

  Stream<List<HistoryModel>> readHistory() => FirebaseFirestore.instance
      .collection('history')
      .where("userID", isEqualTo: 'MCN8x281XsbxhSfh3laY3pWVpk62')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => HistoryModel.fromJson(doc.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorTheme.primaryDark,
        title: Text('History List'),
      ),
      body: StreamBuilder<List<HistoryModel>>(
          stream: readHistory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final histories = snapshot.data;
              return ListView(
                children: histories!.map(buildHistory).toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget buildHistory(HistoryModel history) => ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColorTheme.primaryDark,
        ),
        title: Text(history.beachName),
        subtitle: Text(history.price),
      );
}
