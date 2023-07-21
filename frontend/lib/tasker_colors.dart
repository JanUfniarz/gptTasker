import 'package:flutter/material.dart';

class TaskerColors {

  // Basic colors
  static final Color backgroundColor = Colors.grey[900]!;
  static const Color main = Colors.grey;
  static const Color mainPrimary = Colors.deepPurpleAccent;

  // colors
  static const Color green = Colors.lightGreen;
  static const Color red = Colors.red;
  static final Color blue = Colors.blue[300]!;
  static const Color yellow = Colors.yellowAccent;

  static List<Color> asList() => [
    main, mainPrimary, green, red, blue, yellow
  ];
}