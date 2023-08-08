import 'package:flutter/material.dart';
import 'package:lesson_40_rick_and_morty/presentation/theme/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;

  ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      elevation: 0,
    ),
  );

  void changeTheme() {
    isDarkTheme = !isDarkTheme;

    theme = ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
        elevation: 0,
      ),
    );

    notifyListeners();
  }
}
