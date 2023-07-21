import 'package:flutter/material.dart';

class TaskerColors {

  // Basic colors
  static final Color backgroundColor = Colors.grey[900]!;
  static const Color main = Colors.grey;

  // colors
  static const Color purple = Colors.deepPurpleAccent;
  static const Color green = Colors.lightGreen;
  static const Color red = Colors.red;
  static final Color blue = Colors.blue[300]!;
  static const Color yellow = Colors.yellowAccent;

  static List<Color> asList() => [
    main, purple, green, red, blue, yellow
  ];
}