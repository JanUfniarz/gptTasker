import 'package:flutter/material.dart';
import 'package:frontend/widgets/taks_card.dart';

import '../tasker_colors.dart';

class TaskGallery extends StatelessWidget {
  const TaskGallery({
    super.key,
    required this.task,
    required this.primary,
    this.taskCards,
  });

  final String task;
  final Color primary;
  final List<TaskCard>? taskCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Text(
            task,
            style: const TextStyle(
              color: TaskerColors.main,
              fontSize: 24,
            ),
          ),

        ),

        Divider(
          color: primary,
          thickness: 2,
        ),

        SingleChildScrollView(
          child: Row(
            children: taskCards ?? [],
          ),
        ),

        const SizedBox(height: 20),

      ],
    );
  }
}