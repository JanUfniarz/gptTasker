import 'package:flutter/material.dart';

class SmallSquareButton extends StatelessWidget {
  const SmallSquareButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
  });

  final void Function() onTap;
  final Color color;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),

          child: icon

      ),
    );
  }
}