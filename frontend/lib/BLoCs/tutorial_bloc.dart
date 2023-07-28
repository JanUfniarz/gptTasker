// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:frontend/widgets/big_button.dart';
import 'package:frontend/widgets/small_square_button.dart';
import 'package:frontend/widgets/tasker_text_field.dart';

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

  bool _inProcess = false;
  bool get inProcess => _inProcess;

  List<dynamic>? _fullData;

  List<dynamic>? get fullData => _fullData;

  List<Widget> _actions = [];
  List<Widget> get actions => _actions;

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
    switch (index) {

      case 0:
        _showColors();
        break;

      case 1:
        _showTextField();
        break;

      case 2:
        generateTutorial(topic);
        break;

      case 3:
        _deleteTutorial();
        break;
    }
  }

  void _showColors() {
    List<String> colors = TaskerColors.strList();
    _actions = List.generate(
        colors.length, (index) {
          String color = colors[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: SmallSquareButton(
              onTap: () {
                _inProcess = false;
                notifyListeners();
                _changeColor(color);
              },
              color: TaskerColors.fromString(color),
              icon: Icons.water_drop_outlined,
            ),
          );

        }
    );
    _inProcess = true;
    notifyListeners();
  }

  void _changeColor(String color) {
  }

  void _showTextField() {
    String? newParagraph;
    _actions = [

      BigButton(
          onTap: () {
            _inProcess = false;
            notifyListeners();
          },
          primaryColor: primaryColor,
          text: "Back",
          icon: Icons.backspace_outlined
      ),

      TaskerTextField(
        hintText: "Headline",
        onChanged: (text) => newParagraph = text,
        onSubmitted: (text) {
          _inProcess = false;
          notifyListeners();
          _addParagraph(text);
        },
      ),

      BigButton(
          onTap: () {
            _inProcess = false;
            notifyListeners();
            _addParagraph(newParagraph);
          },
          primaryColor: primaryColor,
          text: "Regenerate",
          icon: Icons.done_sharp
      ),

    ];
    _inProcess = true;
    notifyListeners();
  }

  void _addParagraph(String? headline) {

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