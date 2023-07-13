// ignore_for_file: curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//import 'package:http/http.dart';

void main() {
  runApp(const MainApp());
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
  dynamic str;

  Future<dynamic> _loadData() async {
    print("Loading data");
    final response = await http.get(url);
    print("res body: ${response.body}");
    return jsonDecode(response.body);
  }

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
    _loadData().then((data) => setState((() => str = data)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color mainColor = Colors.orangeAccent;
    Color background = Colors.grey[900]!;

    if (str == null) return Center(
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
                str!["name"],
                style: TextStyle(
                  color: mainColor
                ),
              ),

              Text(
                str!["email"],
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
                        var response = await http.delete(url);
                        _printStatus(response);
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