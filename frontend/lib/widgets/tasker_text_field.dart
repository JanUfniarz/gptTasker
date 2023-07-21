import 'package:flutter/material.dart';

import '../tasker_colors.dart';

class TaskerTextField extends StatelessWidget {
  const TaskerTextField({
    super.key,
    this.hintText,
    required this.onChanged,
    this.onSubmitted
  });

  final String? hintText;
  final void Function(String) onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(
          width: 450,

          child: TextField(

            onChanged: onChanged,
            onSubmitted: onSubmitted,

            decoration: InputDecoration(
              filled: true,
              fillColor: TaskerColors.main,
              hintText: hintText,
            ),
          ),

        ),

      ],
    );
  }
}