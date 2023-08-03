// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/general_bloc.dart';

import '../connection/tutorial_connector.dart';
import '../tasker_colors.dart';
import '../widgets/paragraph_widget.dart';

class TutorialBloc extends ChangeNotifier {

  // === Configuration ===
  TutorialBloc._private();

  static final TutorialBloc _instance = TutorialBloc._private();

  static TutorialBloc get instance => _instance;

  TutorialConnector? _connector;

  set connector(TutorialConnector value) => _connector = value;

  // === State ===
  Color _primaryColor = TaskerColors.main;
  String _topic = "";
  List<Paragraph> _paragraphs = [];
  int _id = -1;

  Color get primaryColor => _primaryColor;
  String get topic => _topic;
  List<Paragraph> get paragraphs => _paragraphs;

  int _actionsStatus = 0;
  int get actionsStatus => _actionsStatus;

  // === Data ===
  List<dynamic>? _fullData;
  List<dynamic>? get fullData => _fullData;

  void fetchData() {
    _connector!.readData()
        .then((data) {
      _fullData = data;
      GeneralBloc.loadTutorialData();
    });
  }

  // === State methods ===
  void openTutorial(int id) {
    _actionsStatus = 0;
    _id = id;
    var tutorial = _fullData!
        .firstWhere(
            (tutorial) => tutorial["id"] == id
    );
    _primaryColor = TaskerColors.fromString(tutorial["primaryColor"]);
    _topic = tutorial["topic"];
    List<dynamic> paragraphsData = tutorial["paragraphs"];

    _paragraphs = List.generate(
        paragraphsData.length,
            (index) {

          var data = paragraphsData[index];
          String headline = data["headline"];

          return Paragraph(
              primaryColor: primaryColor,
              headline: headline,
              body: data["body"],
              delete: () => _deleteParagraph(headline),
              regenerate: () => generateParagraph(headline)
          );
        }
    );
    notifyListeners();
  }

  void redirectMethod(int index) {
    switch (index) {
      case 0:
        _actionsStatus = 1;
        notifyListeners();
      break;
      case 1:
        _actionsStatus = 2;
        notifyListeners();
      break;
      case 2: generateTutorial(topic); break;
      case 3: _deleteTutorial(); break;
    }
  }

  void back() {
    _actionsStatus = 0;
    notifyListeners();
  }

  // === Connector methods ===
  void changeColor(String color) {
    back();
    _primaryColor = TaskerColors.fromString(color);
    _paragraphs = List.generate(
        _paragraphs.length, (index) {
          Paragraph oldP = _paragraphs[index];
          return Paragraph(
            primaryColor: _primaryColor,
            body: oldP.body,
            regenerate: oldP.regenerate,
            delete: oldP.delete,
            headline: oldP.headline,
      );
    });
    notifyListeners();
    _connector!.updateData(
        _id,
        primaryColor: color
    );
  }

  void generateParagraph(String? headline) {
    if (headline == null) return;

    _connector!.updateData(
      _id,
      paragraphToGenerate: headline
    );
  }

  void _deleteTutorial() {
    _connector!.deleteData(_id);
  }

  void _deleteParagraph(String headline) {
    _connector!.updateData(
      _id,
      paragraphToRemove: headline
    );
  }

  void generateTutorial(String topic) => _connector!.createData(topic)
      .whenComplete(() {
        print("generating complete");
        fetchData();
      });
}