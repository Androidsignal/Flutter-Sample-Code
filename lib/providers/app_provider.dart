import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  bool _darkModeEnable = false;

  Locale _appLocal;

  bool get darkModeEnable => _darkModeEnable;

  Locale get appLocal => _appLocal;

  void setAppMode(bool value) {
    _darkModeEnable = value;
    notifyListeners();
  }

  void setAppLocale(Locale value) {
    _appLocal = value;
    notifyListeners();
  }
}
