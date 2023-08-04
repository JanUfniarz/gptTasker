// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:frontend/widgets/small_square_button.dart';

import '../tasker_colors.dart';
import 'big_button.dart';
import 'tasker_text_field.dart';

class TutorialActions {

  static List<Widget> base({
    required BuildContext context,
    required Color color,
    required void Function(int) redirectMethod
  }) {

    const List<String> buttonLabels = [
      "Change\ncolor",
      "Add\nparagraph",
      "Regenerate\ntutorial",
      "Delete\ntutorial",
    ];

    const List<IconData> icons = [
      Icons.color_lens_sharp,
      Icons.add_sharp,
      Icons.refresh_sharp,
      Icons.delete_outline_sharp
    ];

    return List<Widget>.generate(
        buttonLabels.length, (index) =>

        BigButton(
          onTap: () {
            redirectMethod(index);
            if (index == 2 || index == 3)
              Navigator.pop(context);
          },
          primaryColor: index == 3
              ? Colors.redAccent
              : color,
          text: buttonLabels[index],
          icon: icons[index],
        )
    );
  }

  static List<Widget> colors({
    required void Function(String) onTap
  }) {
    List<String> colors = TaskerColors.strList();

    return List.generate(
        colors.length, (index) {
      String color = colors[index];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: SmallSquareButton(
          onTap: () => onTap(color),
          color: TaskerColors.fromString(color),
          icon: Icons.water_drop_outlined,
        ),
      );
    });
  }

  static List<Widget> addParagraph({
    required Color color,
    required void Function() back,
    required void Function(String) regenerate,
  }) {
    String? newParagraph;
    return [
      BigButton(
          onTap: () => back(),
          primaryColor: color,
          text: "Back",
          icon: Icons.backspace_outlined
      ),

      TaskerTextField(
        hintText: "Headline",
        onChanged: (text) => newParagraph = text,
        onSubmitted: (text) => regenerate(text),
      ),

      BigButton(
          onTap: () {
            if (newParagraph != null)
              regenerate(newParagraph!);
          },
          primaryColor: color,
          text: "Add\nparagraph",
          icon: Icons.done_sharp
      ),

    ];
  }
}