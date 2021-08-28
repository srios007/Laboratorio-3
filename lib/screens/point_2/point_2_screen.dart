import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Point2Screen extends StatefulWidget {
  Point2Screen({this.page});
  int page;

  @override
  _Point2ScreenState createState() => _Point2ScreenState();
}

class _Point2ScreenState extends State<Point2Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      margin: const EdgeInsets.only(top: 200),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Palette.cumbiaLight,
            child: Text('Página ${widget.page}'),
          )
        ],
      ),
    );
  }
}
