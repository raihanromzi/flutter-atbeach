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
  'https://i.ibb.co/TPTkn3s/banner1.png',
  'https://i.ibb.co/GHsHbQt/banner2.png'
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
              actions: [
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {},
                ),
              ],
              expandedHeight: 270.0,
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
                  height: 40,
                ),
                DestinationCarousel(),
                SizedBox(
                  height: 40,
                ),
                DestinationCarousel(),
                SizedBox(
                  height: 40,
                ),
                DestinationCarousel()
              ]),
            ),
          ])),
    );
  }
}
