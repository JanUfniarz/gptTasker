// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:frontend/BLoCs/general_bloc.dart';
import 'package:frontend/widgets/big_button.dart';
import 'package:frontend/widgets/small_square_button.dart';
import 'package:frontend/widgets/tasker_text_field.dart';

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

  bool _inProcess = false;
  bool get inProcess => _inProcess;

  List<Widget> _actions = [];
  List<Widget> get actions => _actions;

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
              regenerate: () => _generateParagraph(headline)
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
          _generateParagraph(text);
        },
      ),

      BigButton(
          onTap: () {
            _inProcess = false;
            notifyListeners();
            _generateParagraph(newParagraph);
          },
          primaryColor: primaryColor,
          text: "Add paragraph",
          icon: Icons.done_sharp
      ),

    ];
    _inProcess = true;
    notifyListeners();
  }

  // === Connector methods ===
  void _changeColor(String color) {
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

  void _generateParagraph(String? headline) {
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