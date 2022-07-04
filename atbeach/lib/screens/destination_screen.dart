// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:atbeach/model/destination_model.dart';
import 'package:atbeach/screens/home_screen.dart';
import 'package:atbeach/widget/app_color_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:atbeach/model/history_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColorTheme.primaryDark,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.destination.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColorTheme.primaryDark, width: 4)),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new,
                              color: AppColorTheme.primaryDark, size: 24),
                          onPressed: () => {Navigator.pop(context)},
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.destination.city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 5.0),
                          Text(
                            widget.destination.price,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.destination.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                      onPressed: () {
                        addHistory();
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: AppColorTheme.secondaryDark,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Checkout',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addHistory() async {
    final checkout = FirebaseFirestore.instance.collection('history').doc();

    final history = HistoryModel(
        beachName: widget.destination.city,
        price: widget.destination.price,
        userID: 'MCN8x281XsbxhSfh3laY3pWVpk62');

    await checkout.set(history.toJson());

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
    Fluttertoast.showToast(msg: 'Checkout Success!');
  }
}
