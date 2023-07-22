import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/general_bloc.dart';
import 'package:frontend/widgets/big_button.dart';
import 'package:frontend/widgets/tasker_scaffold.dart';
import 'package:provider/provider.dart';

import '../tasker_colors.dart';
import '../widgets/task_gallery.dart';
import '../widgets/tasker_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<IconData> _icons = [
    Icons.book_outlined,
    Icons.note_add_outlined,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {

    Color primary = TaskerColors.purple;

    return Consumer<GeneralBloc>(
      builder: (context, bloc, child) =>
          TaskerScaffold(
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

                          bloc.tasks.length, (index) {

                              String task = bloc.tasks[index];

                              Color color = bloc.pickedTask == task
                                  ? primary
                                  : TaskerColors.main;

                              return BigButton(
                                onTap: () => bloc.pick(task),
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
                      onChanged: (text) => bloc.topic = text,
                      onSubmitted: (text) => bloc.submitTutorialGeneration(
                        topic: text
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          BigButton(
                              onTap: () => bloc.submitTutorialGeneration(),
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
                      taskCards: bloc.tutorialCards
                    ),

                  ],
                ),
              ),
            ),
          ),
    );
  }
}