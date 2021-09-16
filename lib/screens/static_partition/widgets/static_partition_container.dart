import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class StaticPartitionContainer extends StatefulWidget {
  StaticPartitionContainer({
    @required this.process,
  });
  Process process;

  @override
  _StaticPartitionContainerState createState() =>
      _StaticPartitionContainerState();
}

class _StaticPartitionContainerState extends State<StaticPartitionContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.process.isDeleted
        ? Container(height: 100)
        : Container(
            margin: EdgeInsets.only(
              bottom: 100 - ((widget.process.size / 2) * 100),
            ),
            height: (widget.process.size / 2) * 100,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.black,
              ),
              color: widget.process.color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.process.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Palette.white,
                  ),
                ),
                Text(
                  '${widget.process.size} mb',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Palette.white,
                  ),
                ),
              ],
            ),
          );
  }
}
