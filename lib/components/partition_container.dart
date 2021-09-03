import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class PartitionContainer extends StatefulWidget {
  @override
  _PartitionContainerState createState() => _PartitionContainerState();
}

class _PartitionContainerState extends State<PartitionContainer> {
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