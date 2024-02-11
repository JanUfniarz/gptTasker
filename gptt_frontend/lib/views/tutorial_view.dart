import 'package:flutter/material.dart';
import 'package:frontend/widgets/tutorial_actions.dart';
import 'package:provider/provider.dart';

import '../BLoCs/tutorial_bloc.dart';
import '../widgets/tasker_scaffold.dart';

class TutorialView extends StatelessWidget {
  const TutorialView({super.key,});

  @override
  Widget build(BuildContext context) =>
    Consumer<TutorialBloc>(
      builder: (context, bloc, child) {
        List<Widget>? actions;

        switch (bloc.actionsStatus) {
          case 0 :
            actions = TutorialActions.base(
                context: context,
                color: bloc.primaryColor,
                redirectMethod: (index) => bloc.redirectMethod(index),
            );
          break;
          case 1 :
            actions = TutorialActions.colors(
                onTap: (color) => bloc.changeColor(color),
            );
          break;
          case 2 :
            actions = TutorialActions.addParagraph(
                color: bloc.primaryColor,
                back: () => bloc.back(),
                regenerate: (headline) {
                  bloc.back();
                  bloc.generateParagraph(headline);
                },
            );
          break;
        }

        return TaskerScaffold(
          primaryColor: bloc.primaryColor,
          tittle: bloc.topic,
          buttons: actions,
          body: SingleChildScrollView(
            child: Column(
                children: bloc.paragraphs,
            ),
          ),
        );
      }
    );
}