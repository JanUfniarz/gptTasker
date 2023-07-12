// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  //? List<dynamic>? users;
  //
  // Future<List<dynamic>> _loadData() async =>
  //     await jsonDecode((await http.get(
  //     Uri.parse("http://localhost:8080/api/v1/student")))
  //?     .body)["results"] as List<dynamic>;

  String? str;

  Future<String> _loadData() async {
    print("Loading data");
    final response = await http.get(Uri.parse(
        "http://localhost:8080/api/v1/data"
    ));
    print("res body: ${response.body}");
    return response.body;
  }

  @override
  void initState() {
    print("init!");
    _loadData().then((data) => setState((() => str = data)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if (str == null) return const Center(
        child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        )
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Text(
            str!,
            style: const TextStyle(
              color: Colors.orangeAccent
            ),
          ),
        ),
      ),
    );
  }
}