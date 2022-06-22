import 'package:atbeach/screens/home_screen.dart';
import 'package:atbeach/screens/onboarding_view.dart';
import 'package:atbeach/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //     options: FirebaseOptions(
      //   apiKey: "AIzaSyCt8sosL1Guz9lmtrRU0Y_5Zqsk2Dx4YnQ",
      //   appId: "1:501238461839:android:6151b630eb171c020287fa",
      //   messagingSenderId: "501238461839",
      //   projectId: "atbeachauth-2022",
      // )
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomeScreen(),
    // );
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 4)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: OnBoardingView(),
            );
          }
        });
  }
}
