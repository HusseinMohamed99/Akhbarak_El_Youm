import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {

  String currentLanguage = 'en';

  void changeLanguage(String newLanguage)async {
    final pref =await SharedPreferences.getInstance();
    if(currentLanguage == newLanguage)return;
    currentLanguage = newLanguage;
    pref.setString("Lang", currentLanguage);
    notifyListeners();
  }

  void refreshApp() {
    notifyListeners();
  }
}

