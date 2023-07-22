// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/general_bloc.dart';
import 'package:frontend/connection/tutorial_connector.dart';
import 'package:frontend/tasker_colors.dart';
import 'package:frontend/views/home_view.dart';

import 'BLoCs/tutorial_bloc.dart';

void main() {

  GeneralBloc generalBloc = GeneralBloc.instance;
  TutorialBloc tutorialBloc = TutorialBloc.instance;
  TutorialConnector tutorialConnector = TutorialConnector();

  generalBloc.tutorialBloc = tutorialBloc;
  tutorialBloc.connector = tutorialConnector;



  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: TaskerColors.purple
    ),
    home: const HomeView(),
  ));
}