import 'package:atbeach/screens/navbarpages/explore_page.dart';
import 'package:atbeach/screens/navbarpages/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/app_color_theme.dart';
import 'navbarpages/history_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';
  String uid = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  // getInfo() async {
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
  //   }
  //   print(firebaseUser?.uid);
  //   print(firebaseUser?.displayName);
  // }
  PageController pageController = PageController();

  List<Widget> pages = [
    ExplorePage(),
    GalleryPage(),
    HistoryPage(),
  ];
  int _currentIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onItemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.primaryDark,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColorTheme.primaryDark,
        currentIndex: _currentIndex,
        onTap: onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
