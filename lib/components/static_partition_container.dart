import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class StaticPartitionContainer extends StatefulWidget {
  @override
  _StaticPartitionContainerState createState() => _StaticPartitionContainerState();
}

class _StaticPartitionContainerState extends State<StaticPartitionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.darkBlue,
        ),
        color: Palette.lightBlue.withOpacity(0.3),
      ),
    );
  }
}