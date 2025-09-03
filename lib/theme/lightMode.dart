import 'package:flutter/material.dart';

// Light Mode Color Scheme
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  secondary: Color(0xFF0F3F5F), // Dark Blue
  onPrimary: Color(0xFFFFFFFF), // Pure White
  primary: Color(0xFFFF8C00), // Vibrant Orange
  onSecondary: Color(0xFFFFFFFF), // Pure White
  error: Color(0xFFB00020), // Red
  onError: Color(0xFFFFFFFF), // Pure White
  background: Color(0xFFFFFFFF), // Pure White
  onBackground: Color(0xFF212121), // Dark Gray
  surface: Color(0xFFF0F2F5), // Light Gray
  onSurface: Color(0xFF212121), // Dark Gray
);

// ThemeData for Light Mode
ThemeData lightModeTheme = ThemeData(
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
);