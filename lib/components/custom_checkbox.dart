import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';

class CustomCheckBox extends StatefulWidget {
  bool partition;
  String text;
  int size;
  CustomCheckBox({
    @required this.partition,
    @required this.text,
    @required this.size,
  });
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Checkbox(
          value: widget.partition,
          activeColor: Palette.normalBlue,
          onChanged: (value) {
            setState(() {
              print(widget.partition);
              widget.partition = value;
              print(widget.partition);
            });
          },
        ),
        Container(
          width: 130,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          width: 70,
          child: Center(
            child: Text(
              '${widget.size} mb',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
