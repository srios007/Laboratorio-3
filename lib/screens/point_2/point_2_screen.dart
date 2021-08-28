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
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Palette.cumbiaLight,
          child: Text('Página ${widget.page + 1}'),
        )
      ],
    );
  }
}
