import 'package:flutter/material.dart';
import 'package:frontend/tasker_colors.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.onTap,
    required this.primaryColor,
    required this.text,
    required this.icon,
  });

  final void Function() onTap;
  final Color primaryColor;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) => InkWell(

      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SizedBox(
          width: 120,
          height: 50,
          child: Card(
            color: primaryColor,
            child: Card(
              color: TaskerColors.backgroundColor,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),


                      Icon(
                        icon,
                        color: primaryColor,
                        size: 24,
                      )

                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
}