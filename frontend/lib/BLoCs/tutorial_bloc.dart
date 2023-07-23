// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../connection/tutorial_connector.dart';
import '../tasker_colors.dart';
import '../widgets/paragraph_widget.dart';

class TutorialBloc extends ChangeNotifier {

  TutorialBloc._private();

  static final TutorialBloc _instance = TutorialBloc._private();

  static TutorialBloc get instance => _instance;

  TutorialConnector? _connector;

  set connector(TutorialConnector value) => connector = value;

  Color _primaryColor = TaskerColors.main;
  String _topic = "";
  List<Paragraph> _paragraphs = [];


  Color get primaryColor => _primaryColor;
  String get topic => _topic;
  List<Paragraph> get paragraphs => _paragraphs;

  List<dynamic>? _fullData;

  void openTutorial(int id) {

  }

  void redirectMethod(int index) {

  }

  void _changeColor() {

  }

  void _addParagraph() {

  }

  void _deleteTutorial() {

  }

  void _regenerateParagraph() {

  }

  void _deleteParagraph() {

  }

  void generateTutorial(String topic) => _connector!.createData(topic)
      .whenComplete(() => print("generating complete"));

  void _fetchData() => _connector!.readData()
      .then((data) => _fullData = data);


}