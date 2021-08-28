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
