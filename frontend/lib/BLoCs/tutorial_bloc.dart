// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../connection/tutorial_connector.dart';
import '../tasker_colors.dart';
import '../widgets/paragraph_widget.dart';

class TutorialBloc extends ChangeNotifier {

  TutorialBloc._private() {
    print("TB - generated");
  }

  static final TutorialBloc _instance = TutorialBloc._private();

  static TutorialBloc get instance => _instance;

  TutorialConnector? _connector;

  set connector(TutorialConnector value) => _connector = value;

  void onCreate() {
    print("TB - onCreate");
    _fetchData();
    notifyListeners();
  }

  Color _primaryColor = TaskerColors.main;
  String _topic = "";
  List<Paragraph> _paragraphs = [];


  Color get primaryColor => _primaryColor;
  String get topic => _topic;
  List<Paragraph> get paragraphs => _paragraphs;

  bool _dataFetched = false;
  bool get dataFetched => _dataFetched;

  List<dynamic>? _fullData;

  List<dynamic>? get fullData => _fullData;

  void openTutorial(int id) {
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
              regenerate: () => _regenerateParagraph(headline)
          );
        }
    );
    notifyListeners();
  }

  void redirectMethod(int index) {

  }

  void _changeColor() {

  }

  void _addParagraph() {

  }

  void _deleteTutorial() {

  }

  void _regenerateParagraph(String headline) {

  }

  void _deleteParagraph(String headline) {

  }

  void generateTutorial(String topic) => _connector!.createData(topic)
      .whenComplete(() => print("generating complete"));

  void _fetchData() {
    print("TB - fetching data");
    _connector!.readData()
        .then((data) {
      _fullData = data;
      _dataFetched = true;
      print("TB - data fetched");
    });
  }
}