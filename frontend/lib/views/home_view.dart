import 'package:flutter/material.dart';
import 'package:frontend/widgets/big_button.dart';
import 'package:frontend/widgets/tasker_scaffold.dart';

import '../tasker_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<String> _tasks = [
    "Tutorial",
    "Other 1",
    "Other 2",
  ];

  List<IconData> icons = [
    Icons.book_outlined,
    Icons.note_add_outlined,
    Icons.person
  ];

  String pickedTask = "";

  @override
  void initState() {
    pickedTask = _tasks[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TaskerScaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(

                _tasks.length, (index) {
                  String task = _tasks[index];

                  Color color = pickedTask == task
                      ? TaskerColors.mainPrimary
                      : TaskerColors.main;

                  return BigButton(
                    onTap: () =>
                        setState(() =>
                        pickedTask = task),
                    primaryColor: color,
                    text: task,
                    icon: Icon(
                      icons[index],
                      color: color,
                    )
                  );
                }

              )
            ),
          )
        ],
      ),
    );
  }
}
