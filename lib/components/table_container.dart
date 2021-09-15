import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class TableContainer extends StatelessWidget {
  const TableContainer({this.process});
  final Process process;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
          ),
          height: 40,
          width: 167,
          child: Center(
            child: Text(
              process.name,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
          ),
          height: 40,
          width: 167,
          child: Text(
            '0x${(process.size * 1048576).round().toRadixString(16)}',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: Palette.darkBlue,
            ),
          ),
          height: 40,
          width: 167,
          child: Text(
            '${process.size} mb',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
