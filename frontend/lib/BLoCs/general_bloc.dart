// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/tutorial_bloc.dart';
import 'package:frontend/tasker_colors.dart';

import '../widgets/taks_card.dart';

class GeneralBloc extends ChangeNotifier {

  // === Configuration ===
  GeneralBloc._private() {
    print("GB - generated");
  }

  static final GeneralBloc _instance = GeneralBloc._private();

  static GeneralBloc get instance => _instance;

  TutorialBloc? _tutorialBloc;

  set tutorialBloc(TutorialBloc value) => _tutorialBloc = value;

  void onCreate() {
    print("GB - onCreate");
    _pickedType = _types[0];
    _loadTutorialData();
    notifyListeners();
  }

  // === State ===
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

  // === Data ===
  void _loadTutorialData() async {
    print("GB - loadData:");
    await waitForData(10);
    if (_tutorialBloc!.fullData == null) return;
    print("GB - \tfullData != null");

    String type = "Tutorial";
    List<dynamic> data = _tutorialBloc!.fullData!;

    _tutorialCards = List.generate(
        data.length, (index) {
          print("\ttutorialCard $index");
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

  Future<void> waitForData(int seconds) async {
    print("waiting...");
    int it = seconds;
    while (!_tutorialBloc!.dataFetched && it > 0) {
      await Future.delayed(const Duration(seconds: 1));
      print(it);
      it--;
    }
    if (!_tutorialBloc!.dataFetched) print(
        "10 sec passed and data is still not available"
    );
  }

  // === State methods ===
  void pick(String type) {
    _pickedType = type;
    notifyListeners();
  }

  // === TutorialBloc methods ===
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