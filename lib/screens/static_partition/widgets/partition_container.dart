import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';

class PartitionContainer extends StatefulWidget {
  double height;
  double width;
  String label;
  PartitionContainer({this.height, this.width, this.label});
  @override
  _PartitionContainerState createState() => _PartitionContainerState();
}

class _PartitionContainerState extends State<PartitionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 100,
      width: widget.width ?? 500,
      decoration: BoxDecoration(
        border: Border.all(
          color: Palette.black,
        ),
        color: Palette.lightGrey,
      ),
      child: Center(
        child: Text(
          widget.label ?? '2 mb',
        ),
      ),
    );
  }
}
