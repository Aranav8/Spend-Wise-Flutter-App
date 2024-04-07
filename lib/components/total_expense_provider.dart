import 'package:flutter/material.dart';

class TotalExpenseProvider extends ChangeNotifier {
  double _totalExpenseAmount = 0.0;

  double get totalExpenseAmount => _totalExpenseAmount;

  void updateTotalExpense(double amount) {
    _totalExpenseAmount += amount;
    notifyListeners();
  }
}
