import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {

  final Color primaryColor;
  final String headline;
  final String body;

  final void Function() delete;
  final void Function() regenerate;

  const Paragraph({
    required this.primaryColor,
    required this.headline,
    required this.body,
    required this.delete,
    required this.regenerate,
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
                    fontSize: 28
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Divider(
                    color: primaryColor,
                    thickness: 2,
                  ),
                ),

                const SizedBox(width: 20),

                InkWell(
                  onTap: regenerate,

                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),

                    child: const Icon(
                      Icons.refresh_sharp
                    ),

                  ),
                ),

                const SizedBox(width: 10),

                InkWell(
                  onTap: delete,

                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(4),
                    ),

                    child: const Icon(
                        Icons.delete_outline_sharp
                    ),

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
