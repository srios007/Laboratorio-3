import 'package:flutter/material.dart';

import 'screens/point_1/point_1_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratorio 3',
      home: Point1Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

