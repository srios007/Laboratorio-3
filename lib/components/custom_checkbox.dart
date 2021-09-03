import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';
import 'package:laboratorio_3/models/models.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({
    @required this.process,
    @required this.onChanged,
  });

  Process process;
  Function(bool) onChanged;
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
            value: widget.process.isSelected,
            activeColor: Palette.normalBlue,
            onChanged: widget.onChanged,
          ),
          Container(
            width: 130,
            child: Center(
              child: Text(
                widget.process.name,
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
                '${widget.process.size} mb',
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
