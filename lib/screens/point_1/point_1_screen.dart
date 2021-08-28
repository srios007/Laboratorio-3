import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/components/components.dart';
import 'package:laboratorio_3/config/config.dart';

class Point1Screen extends StatefulWidget {
  @override
  _Point1ScreenState createState() => _Point1ScreenState();
}

class _Point1ScreenState extends State<Point1Screen> {
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
              page = 0;
            });
          },
          () {
            setState(() {
              page = 1;
            });
          },
          () {
            setState(() {
              page = 2;
            });
          },
          () {
            setState(() {
              page = 3;
            });
          },
          () {
            setState(() {
              page = 4;
            });
          },
          () {
            setState(() {
              page = 5;
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
            child: pages(),
          ),
        ),
      ),
    );
  }

  Widget pages() {
    if (page == 0) {
      return page0();
    } else if (page == 1) {
      return page1();
    } else if (page == 2) {
      return page2();
    } else if (page == 3) {
      return page3();
    } else if (page == 4) {
      return page4();
    } else if (page == 5) {
      return page5();
    }
  }

  Widget page0() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        ),
      ],
    );
  }

  Widget page1() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        )
      ],
    );
  }

  Widget page2() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        )
      ],
    );
  }

  Widget page3() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        )
      ],
    );
  }

  Widget page4() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        )
      ],
    );
  }

  Widget page5() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${page + 1}'),
        )
      ],
    );
  }
}
