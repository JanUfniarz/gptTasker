import 'package:flutter/material.dart';
import 'package:frontend/widgets/paragraph_widget.dart';

class TutorialView extends StatefulWidget {
  const TutorialView({super.key});

  @override
  State<TutorialView> createState() => _TutorialViewState();
}

class _TutorialViewState extends State<TutorialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tytuł",
          style: TextStyle(
            color: Colors.lightGreen,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: const <Paragraph>[
            Paragraph(
              primaryColor: Colors.lightGreen,
              headline: "Nagłówek",
              body: "W powyższym kodzie, do metody postDataToApi, putDataToApi i deleteDataFromApi przekazujemy odpowiednie dane w formie Map<String, dynamic>, które są następnie zakodowane do formatu JSON za pomocą funkcji json.encode() i wysyłane w ciele żądania.",
            ),
            Paragraph(
              primaryColor: Colors.lightGreen,
              headline: "headline",
              body: "W takim przypadku, musisz rozszerzyć funkcjonalność Twojego repozytorium o metody obsługujące żądania HTTP typu GET, PUT, POST i DELETE. Wykorzystamy do tego celu klasę http.Client z pakietu http, która pozwoli nam na wykonywanie różnych rodzajów żądań. Przykład klasy repozytorium z implementacją tych metod wyglądałby następująco:"
            )
          ],
        ),
      ),
    );
  }
}
