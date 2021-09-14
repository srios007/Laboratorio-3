import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class DynamicPartitionContainer extends StatefulWidget {
  DynamicPartitionContainer({
    @required this.process,
    @required this.withCompaction,
  });
  Process process;
  bool withCompaction;

  @override
  _DynamicPartitionContainerState createState() =>
      _DynamicPartitionContainerState();
}

class _DynamicPartitionContainerState extends State<DynamicPartitionContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.process.isDeleted
        ? Container(
            height: widget.withCompaction ? 0 : (widget.process.size / 2) * 100)
        : Container(
          // margin: EdgeInsets.only(
          //     bottom: widget.process.size < 0.4
          //       ? 25:widget.process.size <= 1
          //         ? 50 - ((widget.process.space??0 / 2) * 100)
          //         : 0,
            // ),
            height: (widget.process.size / 2) * 100,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.darkBlue,
              ),
              color: Palette.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.process.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${widget.process.size} mb',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          );
  }
}
