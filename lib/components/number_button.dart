import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final TextEditingController controller;

  NumberButton({this.text, required this.onPressed, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              '$text',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
