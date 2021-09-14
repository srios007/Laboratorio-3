import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laboratorio_3/config/config.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.onPressed,
    this.title,
    this.backgroundColor,
    this.shadowColor,
    this.isActive = false,
    this.height,
    this.width,
    this.padding,
  });
  String title;
  Color backgroundColor;
  Color shadowColor;
  Function onPressed;
  bool isActive;
  double height;
  double width;

  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: height ?? 100,
          width: width ?? 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Palette.lightBlue,
              width: 3
            ),
            color: Palette.white,
          ),
          child: CupertinoButton(
            padding: padding ?? EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
