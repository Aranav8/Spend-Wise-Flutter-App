import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> mode = [
  {
    'id': 0,
    'icon': FontAwesomeIcons.moneyBill,
    'name': 'Cash',
  },
  {
    'id': 1,
    'icon': FontAwesomeIcons.creditCard,
    'name': 'Card',
  },
  {
    'id': 2,
    'icon': FontAwesomeIcons.globe,
    'name': 'Online',
  },
];

List<Map<String, dynamic>> motive = [
  {
    'id': 0,
    'icon': FontAwesomeIcons.shirt,
    'name': 'Shopping',
  },
  {
    'id': 1,
    'icon': FontAwesomeIcons.gift,
    'name': 'Gifts',
  },
  {
    'id': 2,
    'icon': FontAwesomeIcons.bowlFood,
    'name': 'Food',
  },
  {
    'id': 3,
    'icon': FontAwesomeIcons.car,
    'name': 'Travelling',
  },
  {
    'id': 4,
    'icon': FontAwesomeIcons.shop,
    'name': 'Other',
  },
];

// List<Map<String, dynamic>> get motiveList => _motive;
// List<Map<String, dynamic>> get modeList => _mode;