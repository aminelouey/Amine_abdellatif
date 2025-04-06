import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _isDarkMode
      ? ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF000B24),
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF90CAF9),
            secondary: Color(0xFF90CAF9),
          ),
        )
      : ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1976D2),
            secondary: Color(0xFF1976D2),
          ),
        );

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
