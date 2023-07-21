import 'package:flutter/material.dart';

import '../tasker_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.topic,
    required this.primaryColor,
    required this.type,
  });

  final String topic;
  final Color primaryColor;

  final String type;

  @override
  Widget build(BuildContext context) {

    Widget icon;

    switch (type) {

      case "Tutorial" :
        icon = Icon(
          Icons.book_outlined,
          color: primaryColor,
          size: 40,
        );
        break;

      case "Other 1" :
        icon = Icon(
          Icons.note_add_outlined,
          color: primaryColor,
          size: 40,
        );
        break;

      case "Other 2" :
        icon = Icon(
          Icons.person,
          color: primaryColor,
          size: 40,
        );
        break;

      case "Loading" :
        icon = const CircularProgressIndicator(
          color: TaskerColors.main,
        );
        break;

      default :
        icon = const Icon(
          Icons.not_interested,
          color: Colors.redAccent,
          size: 40,
        );
        break;
    }

    return InkWell(
      onTap: () {},

      child: SizedBox(
        height: 128,
        width: 100,
        child: Card(
          color: primaryColor,
          child: Card(
            color: TaskerColors.backgroundColor,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    topic,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),

                icon,

              ],
            ),

          ),
        ),
      ),
    );
  }
}