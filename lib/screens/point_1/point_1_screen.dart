import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Point1Screen extends StatefulWidget {
  Point1Screen({this.page});
  int page;
  @override
  _Point1ScreenState createState() => _Point1ScreenState();
}

class _Point1ScreenState extends State<Point1Screen> {
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
