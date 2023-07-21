// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/tasker_colors.dart';
import 'package:frontend/views/home_view.dart';
import 'package:frontend/views/tutorial_view.dart';
import 'package:frontend/widgets/paragraph_widget.dart';

import 'package:http/http.dart' as http;

void main() {
  // runApp(const MainApp());
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: TaskerColors.purple
    ),
      initialRoute: "/home",
      routes: {
      "/main" : (context) => const MainApp(),
        "/home" : (context) => const HomeView(),
      "/tutorial" : (context) => TutorialView(
        primaryColor: TaskerColors.green,
        topic: "temat",
        paragraphs: [
          Paragraph(
            primaryColor: TaskerColors.green,
            headline: "Nagłówek",
            body: "W powyższym kodzie, do metody postDataToApi, putDataToApi i deleteDataFromApi przekazujemy odpowiednie dane w formie Map<String, dynamic>, które są następnie zakodowane do formatu JSON za pomocą funkcji json.encode() i wysyłane w ciele żądania.",
            delete: () {},
            regenerate: () {},
          ),
          Paragraph(
              primaryColor: TaskerColors.green,
              headline: "headline",
              body: "W takim przypadku, musisz rozszerzyć funkcjonalność Twojego repozytorium o metody obsługujące żądania HTTP typu GET, PUT, POST i DELETE. Wykorzystamy do tego celu klasę http.Client z pakietu http, która pozwoli nam na wykonywanie różnych rodzajów żądań. Przykład klasy repozytorium z implementacją tych metod wyglądałby następująco:",
            delete: () {},
            regenerate: () {},
          )
        ],
        regenerate: () {},
        addParagraph: () {},
        changeColor: () {},
      ),
      },
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  // List<dynamic>? users;
  //
  // Future<List<dynamic>> _loadData() async =>
  //     await jsonDecode((await http.get(
  //     Uri.parse("http://localhost:8080/api/v1/student")))
  //     .body)["results"] as List<dynamic>;

  final Uri url = Uri.parse("http://localhost:8080/api/v1/data");
  dynamic data;

  Future<dynamic> _loadData() async {
    print("Loading data");
    final response = await http.get(url);
    print("res body: ${response.body}");
    return jsonDecode(response.body);
  }
  
  void _updateData() => 
      _loadData().then((data) => setState((() => this.data = data)));

  void _printStatus(http.Response response) {
    if (response.statusCode == 200) print(
        'Sukces! Odpowiedź: ${response.body}'
    );
    else print(
        'Błąd ${response.statusCode}'
    );
  }

  @override
  void initState() {
    print("init!");
    _updateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color mainColor = Colors.orangeAccent;
    Color background = Colors.grey[900]!;

    if (data == null) return Center(
        child: CircularProgressIndicator(
          color: mainColor,
        )
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text(
                data!["name"],
                style: TextStyle(
                  color: mainColor
                ),
              ),

              Text(
                data!["email"],
                style: TextStyle(
                    color: mainColor
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      onPressed: () async {

                        var response = await http.post(
                            url,
                            body: {
                              'name': 'Bob',
                              'email': 'bob.wasertyn@example.com',
                              'pin': 7890.toString(),
                            });

                        _printStatus(response);
                        _updateData();
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor
                      ),
                      child: Text(
                        "POST",
                        style: TextStyle(
                          color: background,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(

                      onPressed: () async {

                        var pin = await Navigator.pushNamed(
                          context,
                          "/pin_asker",
                        );

                        if (pin == data["pin"]) {
                          var response = await http.delete(url);
                          _printStatus(response);
                          _updateData();
                        } else print("Niezgodny pin!");
                      },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor
                      ),
                      child: Text(
                        "DELETE",
                        style: TextStyle(
                          color: background,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}