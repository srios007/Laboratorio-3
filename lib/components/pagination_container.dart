import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class PaginationContainer extends StatefulWidget {
  PaginationContainer({
    @required this.process,
  });
  Process process;

  @override
  _PaginationContainerState createState() => _PaginationContainerState();
}

class _PaginationContainerState extends State<PaginationContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.process.isDeleted
        ? Container(
            height: 50,
          )
        : Container(
            margin: EdgeInsets.only(
              bottom: widget.process.size < 0.4
                ? 25:widget.process.size <= 1
                  ? 50 - ((widget.process.size / 2) * 100)
                  : 0,
            ),
            height: widget.process.size < 0.4
                ? 25
                : widget.process.size <= 1
                    ? ((widget.process.size / 2) * 100)
                    : 50,
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
