import 'package:flutter/material.dart';

class AddingButtons extends StatelessWidget {
  final IconData? iconPreffix;
  final IconData? iconSuffix;
  final String text;
  final Color color;
  final void Function()? onPressed;

  AddingButtons(
      {required this.iconPreffix,
      required this.iconSuffix,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconPreffix,
              color: Colors.black,
            ),
            Text(
              '$text',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            Icon(
              iconSuffix,
              color: Colors.black,
            ),
          ],
        ),
      ),
      height: 70.0,
      width: 180.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
