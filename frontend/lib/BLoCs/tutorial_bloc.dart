// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../connection/tutorial_connector.dart';

class TutorialBloc extends ChangeNotifier {

  TutorialBloc._private(){
    //onCreate();
  }

  static final TutorialBloc _instance = TutorialBloc._private();

  static TutorialBloc get instance => _instance;

  TutorialConnector? _connector;

  set connector(TutorialConnector value) => connector = value;

  void generateTutorial(String topic) => _connector!.createData(topic)
      .whenComplete(() => print("generating complete"));
}