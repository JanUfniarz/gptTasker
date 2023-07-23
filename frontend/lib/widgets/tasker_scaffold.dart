import 'package:flutter/material.dart';
import 'package:frontend/tasker_colors.dart';

class TaskerScaffold extends StatelessWidget {
  TaskerScaffold({
    super.key,
    primaryColor,
    buttons,
    tittle,
    this.body
  }) :
        primaryColor = primaryColor ?? TaskerColors.main,
        tittle = tittle ?? "gtp Tasker",
        buttons = buttons ?? [];

  final Color primaryColor;
  final List<Widget> buttons;
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
        actions: buttons + [const SizedBox(width: 60)]
      ),

      body: body
    );
  }
}
