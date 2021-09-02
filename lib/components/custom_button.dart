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
      children: <Widget>[
        Container(
          height: height ?? 40,
          width: width ?? 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isActive ? Palette.normalBlue : Palette.grey,
          ),
          child: CupertinoButton(
            padding: padding ?? EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Palette.white,
                  fontWeight: FontWeight.w400,
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
