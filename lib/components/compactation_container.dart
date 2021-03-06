import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class CompactationContainer extends StatefulWidget {
  CompactationContainer({
    @required this.process,
  });
  Process process;

  @override
  _CompactationContainerState createState() => _CompactationContainerState();
}

class _CompactationContainerState extends State<CompactationContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.process.isDeleted
        ? Container(height: (widget.process.size / 2) * 100)
        : Container(
            margin: EdgeInsets.only(
              bottom: widget.process.space != 0
                  ? (widget.process.space / 2) * 100
                  : 0,
            ),
            height: (widget.process.size / 2) * 100,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(
                color: Palette.darkBlue,
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
