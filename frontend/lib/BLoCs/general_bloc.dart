import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/tutorial_bloc.dart';
import 'package:frontend/tasker_colors.dart';

import '../widgets/taks_card.dart';

class GeneralBloc extends ChangeNotifier {

  GeneralBloc._private();

  static final GeneralBloc _instance = GeneralBloc._private();

  static GeneralBloc get instance => _instance;

  TutorialBloc? _tutorialBloc;

  set tutorialBloc(TutorialBloc value) => _tutorialBloc = value;

  void onCreate() {

    _pickedType = _types[0];
    _loadTutorialData();
    notifyListeners();
  }

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

  void _loadTutorialData() {
    if (_tutorialBloc!.fullData == null) return;

    String type = "Tutorial";
    List<dynamic> data = _tutorialBloc!.fullData!;

    _tutorialCards = List.generate(
        data.length, (index) {
          var unit = data[index];

      return TaskCard(
        topic: unit["topic"],
        primaryColor: TaskerColors.fromString(
            unit["primaryColor"]
        ),
        type: type,
        onTap: () => openTask(
            unit["id"], type
        ),
      );
    });
    notifyListeners();
  }

  void pick(String type) {
    _pickedType = type;
    notifyListeners();
  }

  void submitGeneration({String? topic}) {

    if ((topic == null || topic.isEmpty)
        && (_topic == null || _topic == "")) return;
    topic ??= _topic;

    if (_pickedType == "Tutorial") _tutorialBloc!.generateTutorial(topic!);
  }

  void openTask(int id, String type) {
    // when will be more types use switch

    _tutorialBloc!.openTutorial(id);
  }
}