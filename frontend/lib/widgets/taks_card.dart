import 'package:flutter/material.dart';
import 'package:frontend/views/tutorial_view.dart';

import '../tasker_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.topic,
    required this.primaryColor,
    required this.type,
    required this.onTap,
    required this.refresh,
  });

  final String topic;
  final Color primaryColor;

  final String type;

  final void Function() onTap;
  final void Function() refresh;

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

      onTap: () async {
        onTap();
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const TutorialView()
          )
        );
        refresh();
      },

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

                topic == ""
                    ? const SizedBox()
                    : FittedBox(
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