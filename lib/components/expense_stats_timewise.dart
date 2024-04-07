import 'package:flutter/material.dart';

class ExpenseStatsTimewise extends StatelessWidget {
  final String text;
  final int price;

  ExpenseStatsTimewise({required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 120.0,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            '₹$price',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
