import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final Color? boxColor;
  final String hintText;

  UserTextField(
      {required this.suffixIcon,
      required this.boxColor,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: 80.0,
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: boxColor,
            hintText: '$hintText',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
