import 'package:flutter/material.dart';
import 'package:frontend/widgets/paragraph_widget.dart';

class TutorialView extends StatelessWidget {

  final Color primaryColor;
  final String topic;
  final List<Paragraph> paragraphs;

  final void Function() regenerate;

  const TutorialView({
    required this.primaryColor,
    required this.topic,
    required this.paragraphs,
    required this.regenerate,
    super.key
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

          InkWell(
            onTap: regenerate,
            child: Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Card(
                color: primaryColor,
                child: Card(
                  color: backgroundColor,
                  child: Row(
                    children: <Widget>[

                      Text(
                        "Regenerate \ntutorial",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),

                      Icon(
                        Icons.refresh_sharp,
                        color: primaryColor,
                      ),

                    ]
                  ),
                ),
              ),
            ),
          ),

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
