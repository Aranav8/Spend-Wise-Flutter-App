import 'package:flutter/material.dart';

class SignupButtons extends StatelessWidget {
  final Widget buttonIcon;

  SignupButtons({required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FC),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black),
      ),
      child: IconButton(
        icon: buttonIcon,
        color: Colors.black,
        onPressed: () {},
      ),
    );
  }
}
