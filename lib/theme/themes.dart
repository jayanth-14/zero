import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  final Box box = Hive.box('settings');
  String _mode = "system"; // default: follow system

  ThemeProvider() {
    _mode = box.get("theme_mode", defaultValue: "system");
  }

  String getThemeMode() => _mode;

  bool isDarkMode() {
    if (_mode == "system") {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return _mode == "dark";
  }

  ThemeMode get themeMode {
    switch (_mode) {
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void setThemeMode(String mode) {
    _mode = mode;
    box.put("theme_mode", mode);
    notifyListeners();
  }
}
