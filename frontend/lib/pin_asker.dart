// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PinAsker extends StatelessWidget {
  PinAsker({super.key});

  int? pin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Container(
          color: Colors.teal,
          height: 100,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  onChanged: (text) => pin = int.parse(text),
                ),
              ),
              ElevatedButton(

                onPressed: () => Navigator.pop(context, pin),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.grey[900]
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
