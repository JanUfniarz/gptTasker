import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {

  final Color primaryColor;
  final String headline;
  final String body;

  const Paragraph({
    required this.primaryColor,
    required this.headline,
    required this.body,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[

                Text(
                  headline,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 30
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Divider(
                    color: primaryColor,
                    thickness: 2,
                  ),
                ),

              ],
            ),
          ),

          Text(
            body,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18
            )
          ),

        ],
      ),
    );
  }
}
