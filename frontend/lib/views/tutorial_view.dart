import 'package:flutter/material.dart';
import 'package:frontend/widgets/paragraph_widget.dart';

import '../widgets/app_bar_button.dart';

class TutorialView extends StatelessWidget {

  final Color primaryColor;
  final String topic;
  final List<Paragraph> paragraphs;

  final void Function() regenerate;
  final void Function() addParagraph;

  const TutorialView({
    required this.primaryColor,
    required this.topic,
    required this.paragraphs,
    required this.regenerate,
    required this.addParagraph,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    Color backgroundColor = Colors.grey[900]!;

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: Text(
          topic,
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        shadowColor: primaryColor,
        actions: <Widget>[

          AppBarButton(
            onTap: regenerate,
            primaryColor: primaryColor,
            backgroundColor: backgroundColor,
            text: "Add\nparagraph",
            icon: Icon(
              Icons.add_sharp,
              color: primaryColor,
            ),
          ),

          AppBarButton(
            onTap: regenerate,
            primaryColor: primaryColor,
            backgroundColor: backgroundColor,
            text: "Regenerate\ntutorial",
            icon: Icon(
              Icons.refresh_sharp,
              color: primaryColor,
            ),
          ),

          const SizedBox(width: 60),

        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: paragraphs
        ),
      ),

    );
  }
}