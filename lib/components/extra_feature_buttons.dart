import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraFeatureButtons extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final void Function()? onPressed;

  ExtraFeatureButtons(
      {required this.color,
      required this.icon,
      required this.iconColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: color,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
