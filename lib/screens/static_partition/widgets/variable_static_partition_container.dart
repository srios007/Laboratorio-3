import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class VariableStaticPartitionContainer extends StatefulWidget {
  VariableStaticPartitionContainer({
    @required this.process,
  });
  Process process;

  @override
  _VariableStaticPartitionContainerState createState() =>
      _VariableStaticPartitionContainerState();
}

class _VariableStaticPartitionContainerState extends State<VariableStaticPartitionContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.process.isDeleted
        ? Container(height: 100)
        : Container(
            margin: EdgeInsets.only(
              bottom: widget.process.space - ((widget.process.size / 2) * 100),
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
