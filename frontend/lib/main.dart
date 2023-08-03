import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/general_bloc.dart';
import 'package:frontend/connection/tutorial_connector.dart';
import 'package:frontend/tasker_colors.dart';
import 'package:frontend/views/home_view.dart';
import 'package:provider/provider.dart';

import 'BLoCs/tutorial_bloc.dart';

void main() {

  TutorialConnector tutorialConnector = TutorialConnector();

  TutorialBloc tutorialBloc = TutorialBloc.instance;
  tutorialBloc.connector = tutorialConnector;

  GeneralBloc generalBloc = GeneralBloc.instance;
  generalBloc.tutorialBloc = tutorialBloc;

  generalBloc.refresh();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<GeneralBloc>.value(value: generalBloc),
      ChangeNotifierProvider<TutorialBloc>.value(value: tutorialBloc),
    ],
    child: MaterialApp(
      theme: ThemeData(
        primaryColor: TaskerColors.purple
      ),
      home: const HomeView(),
    ),
  ));
}