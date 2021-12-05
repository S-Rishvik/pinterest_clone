import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static bool isDarkTheme = false;

  ThemeMode get currentThemeMode =>
      isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ColorScheme.light(),
        textTheme: ThemeData.light().textTheme.apply(fontFamily: "Roboto"));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorScheme: ColorScheme.dark(),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Roboto"));
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
