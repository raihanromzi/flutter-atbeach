import 'package:flutter/material.dart';
import 'package:atbeach/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyCt8sosL1Guz9lmtrRU0Y_5Zqsk2Dx4YnQ",
    appId: "1:501238461839:android:6151b630eb171c020287fa",
    messagingSenderId: "501238461839",
    projectId: "atbeachauth-2022",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
