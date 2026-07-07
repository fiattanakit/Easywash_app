import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/Dark_mode.dart';
import 'package:flutter_application_1/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  // Getter สำหรับ themeData
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

 // ตัวตั้งค่าสำหรับ themeData
  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

 // สลับระหว่างโหมดสว่างและโหมดมืด
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}