import 'package:flutter/material.dart';
import 'package:frontend/tasker_colors.dart';

class TaskerScaffold extends StatelessWidget {
  const TaskerScaffold({
    super.key,
    primaryColor,
    this.buttons,
    tittle,
    this.body
  }) :
        primaryColor = primaryColor ?? TaskerColors.main,
        tittle = tittle ?? "gtp Tasker";

  final Color primaryColor;
  final List<Widget>? buttons;
  final String tittle;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaskerColors.backgroundColor,

      appBar: AppBar(
        title: Text(
          tittle,
          style: TextStyle(
            color: primaryColor,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: TaskerColors.backgroundColor,
        shadowColor: primaryColor,
        actions: buttons
      ),

      body: body
    );
  }
}
