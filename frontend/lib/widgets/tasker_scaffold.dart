import 'package:flutter/material.dart';

class TaskerScaffold extends StatelessWidget {
  const TaskerScaffold({
    super.key,
    primaryColor,
    buttons,
    tittle,
    this.body
  }) :
        primaryColor = primaryColor ?? Colors.grey,
        buttons = buttons ?? List.empty,
        tittle = tittle ?? "gtp Tasker";

  final Color primaryColor;
  final List<Widget> buttons;
  final String tittle;
  final Widget? body;

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Colors.grey[900]!;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text(
          tittle,
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        shadowColor: primaryColor,
        actions: buttons
      ),

      body: body
    );
  }
}
