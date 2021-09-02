import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';

class CustomCheckBox extends StatefulWidget {
  bool partition;
  String text;
  CustomCheckBox({
    @required this.partition,
    @required this.text,
  });
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text(
          widget.text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
