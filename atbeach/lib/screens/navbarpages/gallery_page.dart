import 'package:atbeach/controller/unsplash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  UnsplashController unsplashController = Get.put(UnsplashController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(0),
          crossAxisCount: 4,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          itemCount: unsplashController.data.length,
          itemBuilder: (context, index) {
            var currentPhotos = unsplashController.data[index];
            return FadeInDown(
              delay: Duration(milliseconds: index * 50),
              duration: Duration(milliseconds: (index * 50) + 800),
              child: Container(
                color: Colors.black,
                child: Image.network(
                  currentPhotos['urls']['small'],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 4 : 2),
        ),
      ),
    );
  }
}
