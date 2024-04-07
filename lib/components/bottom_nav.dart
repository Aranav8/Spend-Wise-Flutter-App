import 'package:flutter/material.dart';
import 'package:spend_wise/screens/expense_screen.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 70.0,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Color(0xFF1E1D2E),
            borderRadius: BorderRadius.circular(25.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ExpenseScreen.id);
              },
              icon: Icon(
                Icons.grid_view_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bar_chart_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
