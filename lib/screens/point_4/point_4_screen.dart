import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Point4Screen extends StatefulWidget {
    Point4Screen({this.page});
  int page;

  @override
  _Point4ScreenState createState() => _Point4ScreenState();
}

class _Point4ScreenState extends State<Point4Screen> {
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