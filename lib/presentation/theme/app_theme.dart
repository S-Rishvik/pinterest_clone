import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone/presentation/theme/app_colours.dart';

class AppTheme extends ChangeNotifier {
  static bool isDarkTheme = false;

  ThemeMode get currentThemeMode =>
      isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
          primary: AppColors.white,
          onPrimary: AppColors.black,
          background: AppColors.white,
          onBackground: AppColors.black,
          secondary: AppColors.greyWhite,
          onSecondary: AppColors.black,
          surface: AppColors.white,
          onSurface: AppColors.black),
      textTheme: ThemeData.light().textTheme.apply(fontFamily: "Roboto"),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorScheme: ColorScheme.dark(
            primary: AppColors.black,
            onPrimary: AppColors.white,
            background: AppColors.black,
            onBackground: AppColors.white,
            secondary: AppColors.darkGrey,
            onSecondary: AppColors.white,
            surface: AppColors.black,
            onSurface: AppColors.white),
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Roboto"));
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
