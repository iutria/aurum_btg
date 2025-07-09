import 'package:aurum_btg/app/config/config.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  
  bool _isDark = false;

  ThemeMode get theme => _isDark ? ThemeMode.dark : ThemeMode.light;
  bool get isDark => _isDark;
  bool get isLight => !_isDark;

  ThemeProvider() {
    bool? isDark = HiveSettings.isDark;
    if (isDark != null) {
      _isDark = isDark;
    } else {
      _isDark = false;
    }
  }

  void toggleTheme() {
    _isDark = !_isDark;
    HiveSettings.isDark = _isDark;
    notifyListeners();
  }
}
