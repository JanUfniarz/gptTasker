import 'package:flutter/material.dart';
import 'package:frontend/widgets/paragraph_widget.dart';

import '../widgets/big_button.dart';
import '../widgets/tasker_scaffold.dart';

class TutorialView extends StatelessWidget {

  final Color primaryColor;
  final String topic;
  final List<Paragraph> paragraphs;

  final void Function() regenerate;
  final void Function() addParagraph;
  final void Function() changeColor;

  const TutorialView({
    super.key,
    required this.primaryColor,
    required this.topic,
    required this.paragraphs,
    required this.regenerate,
    required this.addParagraph,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return TaskerScaffold(
      primaryColor: primaryColor,
      tittle: topic,
      buttons: <Widget>[

        BigButton(
            onTap: changeColor,
            primaryColor: primaryColor,
            text: "Change\ncolor",
            icon: Icons.color_lens_sharp,
        ),

        BigButton(
          onTap: addParagraph,
          primaryColor: primaryColor,
          text: "Add\nparagraph",
          icon: Icons.add_sharp,
        ),

        BigButton(
          onTap: regenerate,
          primaryColor: primaryColor,
          text: "Regenerate\ntutorial",
          icon: Icons.refresh_sharp,
        ),

        const SizedBox(width: 60),

      ],

      body: SingleChildScrollView(
        child: Column(
          children: paragraphs
        ),
      ),

    );
  }
}