import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String username = '';
  String uid = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  getInfo() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    // if (firebaseUser != null) {
    //   await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(firebaseUser.uid)
    //       .get()
    //       .then((ds) {
    //     username = ds.data()?['username'];
    //     uid = ds.data()?['uid'];
    //   });
    //   print(username);
    //   print(uid);
    // }
    print(firebaseUser?.uid);
    print(firebaseUser?.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // child: Text('History'),
          child: FutureBuilder(
            future: getInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Text('Loading data... please wait');
              }
              return Text(
                'Welcome $username',
                style: TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
