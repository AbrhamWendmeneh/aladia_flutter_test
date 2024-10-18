import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../app/themes.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeModeKey = 'themeMode';
  final Box _box = Hive.box('settings');

  ThemeMode _themeMode;

  ThemeProvider() : _themeMode = _loadThemeMode();

  ThemeMode get themeMode => _themeMode;

  static ThemeMode _loadThemeMode() {
    final box = Hive.box('settings');
    final themeModeIndex = box.get(_themeModeKey, defaultValue: ThemeMode.system.index);
    return ThemeMode.values[themeModeIndex];
  }

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _box.put(_themeModeKey, _themeMode.index);
    notifyListeners();
  }
}