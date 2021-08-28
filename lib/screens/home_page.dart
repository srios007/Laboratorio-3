import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/screens/screens.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  Key key;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  int page = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBarContents(
          () {
            setState(() {
              if (page != 0) {
                page = 0;
              }
            });
          },
          () {
            setState(() {
              if (page != 1) {
                page = 1;
              }
            });
          },
          () {
            setState(() {
              if (page != 2) {
                page = 2;
              }
            });
          },
          () {
            setState(() {
              if (page != 3) {
                page = 3;
              }
            });
          },
          () {
            setState(() {
              if (page != 4) {
                page = 4;
              }
            });
          },
          () {
            setState(() {
              if (page != 5) {
                page = 5;
              }
            });
          },
          _opacity,
        ),
      ),
      body: SafeArea(
        child: WebScrollbar(
          color: Colors.white,
          backgroundColor: Colors.white,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Center(child: pages()),
          ),
        ),
      ),
    );
  }

  Widget pages() {
    if (page == 0) {
      return Home();
    } else if (page == 1) {
      return Point1Screen(page: page);
    } else if (page == 2) {
      return Point2Screen(page: page);
    } else if (page == 3) {
      return Point3Screen(page: page);
    } else if (page == 4) {
      return Point4Screen(page: page);
    } else if (page == 5) {
      return Point5Screen(page: page);
    }
  }
}
