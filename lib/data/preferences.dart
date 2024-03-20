import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  Future<void>? _isLoading;

  void load(){
    _isLoading = _loadFromSharedPreferences();
  }

  Future<void> saveToSharedPrefs() async{
    final prefs = await SharedPreferences.getInstance();
  }

  Future<void> _loadFromSharedPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    // get some data
    // clear some data

    notifyListeners();
  }
}