import 'package:animate_do/animate_do.dart';
import 'package:atbeach/controller/unsplash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../widget/app_color_theme.dart';
import '../widget/circular_indicator_tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UnsplashController unsplashController = Get.put(UnsplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.primaryDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      FadeInDown(
                        delay: Duration(milliseconds: 800),
                        child: Text(
                          'atBeach',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: AppColorTheme.line,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ];
          },
          body: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Column(
                      children: [
                        FadeInDown(
                          duration: Duration(milliseconds: 500),
                          child: TabBar(
                              indicator: CircleTabIndicator(
                                  color: AppColorTheme.line, radius: 4),
                              tabs: const [
                                Tab(
                                  text: "Home",
                                ),
                                Tab(
                                  text: "Gallery",
                                ),
                                Tab(
                                  text: "History",
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    children: [
                      // Home
                      Center(
                        child: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      StaggeredGridView.countBuilder(
                        padding: EdgeInsets.all(0),
                        crossAxisCount: 4,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        itemCount: unsplashController.photos.length,
                        itemBuilder: (context, index) {
                          var currentPhotos = unsplashController.photos[index];
                          return FadeInDown(
                            delay: Duration(milliseconds: index * 50),
                            duration:
                                Duration(milliseconds: (index * 50) + 800),
                            child: Container(
                              color: Colors.black,
                              child: Image.network(
                                currentPhotos.urls['small'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 4 : 2),
                      ),
                      Center(
                        child: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ))
                ],
              )),
        ),
      ),
    );
  }
}
