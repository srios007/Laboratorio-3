import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Point3Screen extends StatefulWidget {
  Point3Screen({this.page});
  int page;

  @override
  _Point3ScreenState createState() => _Point3ScreenState();
}

class _Point3ScreenState extends State<Point3Screen> {
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
