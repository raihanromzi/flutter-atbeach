import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Center(
          child: Container(
            child: SizedBox(
              height: 100,
              child: Image.asset(
                "assets/logo-white.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
  }
}
