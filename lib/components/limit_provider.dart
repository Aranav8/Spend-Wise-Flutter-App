import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LimitProvider extends ChangeNotifier {
  int _limit = 0;
  final String _limitKey = 'limit_key';

  LimitProvider() {
    _loadLimit();
  }

  int get limit => _limit;

  void setLimit(int newLimit) {
    _limit = newLimit;
    _saveLimit();
    notifyListeners();
  }

  Future<void> _saveLimit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_limitKey, _limit);
  }

  Future<void> _loadLimit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _limit = prefs.getInt(_limitKey) ?? 0;
    notifyListeners();
  }
}
