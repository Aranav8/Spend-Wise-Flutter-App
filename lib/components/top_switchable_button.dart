import 'package:flutter/material.dart';

class TopSwitchableButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color? textColor;
  final Function()? onPressed;

  TopSwitchableButton({
    required this.height,
    required this.width,
    required this.text,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
