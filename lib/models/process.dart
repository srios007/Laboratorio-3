import 'package:flutter/material.dart';

class Process {
  String id;
  bool isSelected;
  String name;
  double size;
  double codeSize;
  double dataSize;
  double stackSize;
  bool isDeleted;
  bool isShare;
  double space;
  double totalSize;
  Color color;
  
  Process({
    this.id,
    this.isSelected,
    this.name,
    this.size,
    this.codeSize,
    this.dataSize,
    this.stackSize,
    this.isDeleted,
    this.isShare,
    this.space,
    this.totalSize,
    this.color,
  });
}
