import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BLoCs/tutorial_bloc.dart';
import '../widgets/big_button.dart';
import '../widgets/tasker_scaffold.dart';

class TutorialView extends StatelessWidget {
  const TutorialView({super.key,});

  static const List<String> _buttonLabels = [
    "Change\ncolor",
    "Add\nparagraph",
    "Regenerate\ntutorial",
    "Delete\ntutorial",
  ];

  static const List<IconData> _icons = [
    Icons.color_lens_sharp,
    Icons.add_sharp,
    Icons.refresh_sharp,
    Icons.delete_outline_sharp
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TutorialBloc>(
      builder: (context, bloc, child) =>

          TaskerScaffold(
            primaryColor: bloc.primaryColor,
            tittle: bloc.topic,
            buttons: bloc.inProcess
                ? bloc.actions
                : List<Widget>.generate(
                _buttonLabels.length, (index) =>

                  BigButton(
                    onTap: () => bloc.redirectMethod(index),
                    primaryColor: index == 3
                        ? Colors.redAccent
                        : bloc.primaryColor,
                    text: _buttonLabels[index],
                    icon: _icons[index],
                  )

        ),

        body: SingleChildScrollView(
          child: Column(
              children: bloc.paragraphs
          ),
        ),

      ),
    );
  }
}