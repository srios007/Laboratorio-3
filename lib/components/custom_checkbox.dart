import 'package:flutter/material.dart';

import 'package:laboratorio_3/config/config.dart';

class CustomCheckBox extends StatefulWidget {
  bool isSelected;
  String name;
  int size;
  CustomCheckBox({
    @required this.isSelected,
    @required this.name,
    @required this.size,
  });
  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
            value: widget.isSelected,
            activeColor: Palette.normalBlue,
            onChanged: (value) {
              setState(() {
                print(widget.isSelected);
                widget.isSelected = value;
                print(widget.isSelected);
              });
            },
          ),
          Container(
            width: 130,
            child: Center(
              child: Text(
                widget.name,
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
      ),
    );
  }
}
