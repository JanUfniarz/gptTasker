import 'package:flutter/material.dart';
import 'package:frontend/widgets/big_button.dart';
import 'package:frontend/widgets/tasker_scaffold.dart';

import '../tasker_colors.dart';
import '../widgets/taks_card.dart';
import '../widgets/task_gallery.dart';
import '../widgets/tasker_text_field.dart';

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

  final List<IconData> _icons = [
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

    Color primary = TaskerColors.purple;

    return TaskerScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
              TaskerColors.main
            ),
          ),
          child: ListView(
            children: <Widget>[

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: List.generate(

                    _tasks.length, (index) {
                      String task = _tasks[index];

                      Color color = pickedTask == task
                          ? primary
                          : TaskerColors.main;

                      return BigButton(
                        onTap: () =>
                            setState(() =>
                            pickedTask = task),
                        primaryColor: color,
                        text: task,
                        icon: _icons[index],
                      );

                    }

                  )
                ),
              ),

              TaskerTextField(
                hintText: "Write a tutorial topic",
                onChanged: (text) {},
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigButton(
                      onTap: () {},
                      primaryColor: primary,
                      text: "Generate",
                      icon: Icons.done_sharp
                    ),
                  ],
                ),

              ),

              const SizedBox(height: 50),

              TaskGallery(
                primary: primary,
                task: "Tutorials",
                taskCards: [

                  TaskCard(
                    topic: "topic",
                    primaryColor: TaskerColors.blue,
                    type: "Tutorial"
                  ),

                  const TaskCard(
                      topic: "topic",
                      primaryColor: TaskerColors.main,
                      type: "Loading"
                  ),

                ],
              ),

              TaskGallery(
                task: "Other 1",
                primary: primary,
                taskCards: const [
                  TaskCard(
                    topic: "wvfhcsduwcv",
                    primaryColor: TaskerColors.yellow,
                    type: "Other 1"
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}