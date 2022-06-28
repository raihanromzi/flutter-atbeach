import 'package:atbeach/screens/destination_screen.dart';
import 'package:atbeach/widget/app_color_theme.dart';
import 'package:atbeach/widget/destination_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(3.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class _ExplorePageState extends State<ExplorePage> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  var selectedRange = RangeValues(150.00, 1500.00);

  List<int> list = [1, 2, 3, 4, 5];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_listenToScrollChange);

    super.initState();
  }

  void _listenToScrollChange() {
    if (_scrollController.offset >= 100.0) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColorTheme.primaryDark,
          body: CustomScrollView(controller: _scrollController, slivers: [
            SliverAppBar(
              expandedHeight: 300.0,
              elevation: 0,
              pinned: true,
              floating: true,
              stretch: true,
              backgroundColor: AppColorTheme.primaryDark,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.only(left: 20, right: 30, bottom: 50),
                stretchModes: [
                  StretchMode.zoomBackground,
                  // StretchMode.fadeTitle
                ],
                title: AnimatedOpacity(
                    opacity: _isScrolled ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 500),
                    child: Text('Explore Beautiful Beaches in Indonesia',
                        style: TextStyle(
                          color: AppColorTheme.line,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ))),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    items: imageSliders,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DestinationCarousel()
              ]),
            ),
          ])),
    );
  }
}
