import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/tutorial_bloc.dart';

import '../widgets/taks_card.dart';

class GeneralBloc extends ChangeNotifier {

  GeneralBloc._private() {
    _pickedType = _types[0];
  }

  static final GeneralBloc _instance = GeneralBloc._private();

  static GeneralBloc get instance => _instance;

  TutorialBloc? _tutorialBloc;

  set tutorialBloc(TutorialBloc value) => _tutorialBloc = value;

  final List<String> _types = [
    "Tutorial",
    "Other 1",
    "Other 2",
  ];
  String _pickedType = "";
  List<TaskCard>? _tutorialCards;
  String? _topic;

  List<String> get types => _types;
  String get pickedType => _pickedType;
  List<TaskCard>? get tutorialCards => _tutorialCards;

  set topic(String value) => _topic = value;

  void pick(String type) {
    _pickedType = type;
    notifyListeners();
  }

  void submitTutorialGeneration({String? topic}) {

    if (topic == null && _topic == null) return;
    topic ??= _topic;

    _tutorialBloc!.generateTutorial(topic!);
  }

  //Map<String, Color> getData() {}

  void openTask(int id, String name) {

  }
}