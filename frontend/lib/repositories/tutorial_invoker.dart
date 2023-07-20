// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class TutorialInvoker {
  final String url = "http://localhost:8080/v1/gpt/tutorial";


  TutorialInvoker();

  Future<List<dynamic>> readData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200)
      throw Exception('Failed to load data from server');

    return jsonDecode(response.body);
  }

  Future<void> createData(String topic) async {
    final response = await http.post(
        Uri.parse(url),
        body: {
          "topic": topic
        });

    if (response.statusCode != 201)
      throw Exception('Failed to post data to server');
  }

  Future<void> updateData(
    Long id, {
    String? primaryColor,
    String? paragraphToGenerate,
    String? paragraphToRemove
  }) async {

    final response = await http.put(
      Uri.parse("$url/$id"),
      body: {
        'primaryColor': primaryColor,
        'paragraphToGenerate': paragraphToGenerate,
        'paragraphToRemove': paragraphToRemove,
      }
    );

    if (response.statusCode != 200)
      throw Exception('Failed to update data');
  }

  Future<void> deleteData(Long id) async {
    final response = await http.delete(
      Uri.parse('$url/$id'),
    );

    if (response.statusCode != 200)
      throw Exception('Failed to delete data');
  }
}