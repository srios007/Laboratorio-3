import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class Point5Screen extends StatefulWidget {
    Point5Screen({this.page});
  int page;

  @override
  _Point5ScreenState createState() => _Point5ScreenState();
}

class _Point5ScreenState extends State<Point5Screen> {
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