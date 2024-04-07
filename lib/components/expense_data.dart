import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<double> weeklySummary = [
  4.40,
  2.50,
  42.42,
  95.56,
  88.99,
  90.10,
  78.94,
];

List<Map<String, dynamic>> expenses = [
  {
    'name': 'Expense 1',
    'color': Colors.green[100],
    'icon': FontAwesomeIcons.shirt,
    'category': 'Shopping',
    'amount': 498.50,
    'percentage': '32%',
    'paymentMethod': 'Cash',
  },
  {
    'name': 'Expense 2',
    'color': Colors.purple[100],
    'icon': FontAwesomeIcons.gift,
    'category': 'Gifts',
    'amount': 344.45,
    'percentage': '21%',
    'paymentMethod': 'Card',
  },
  {
    'name': 'Expense 3',
    'color': Colors.orange[100],
    'icon': FontAwesomeIcons.bowlFood,
    'category': 'Food',
    'amount': 230.50,
    'percentage': '12%',
    'paymentMethod': 'Cash',
  },
  {
    'name': 'Expense 4',
    'color': Colors.amber[100],
    'icon': FontAwesomeIcons.car,
    'category': 'Travelling',
    'amount': 160.70,
    'percentage': '8%',
    'paymentMethod': 'Online',
  },
  {
    'name': 'Expense 5',
    'color': Colors.deepPurple[100],
    'icon': FontAwesomeIcons.shop,
    'category': 'Other',
    'amount': 110.20,
    'percentage': '5%',
    'paymentMethod': 'Online',
  },
];
