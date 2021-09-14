import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/home_page.dart';
import 'screens/static_partition/static_partition_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Laboratorio 3',
        debugShowCheckedModeBanner: false,
        home: Home(),
      
        );
  }
}
