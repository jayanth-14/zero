import 'package:flutter/material.dart';

// Dark Mode Color Scheme
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFF8C00), // Vibrant Orange
  onPrimary: Color(0xFF121212), // Very Dark Gray
  secondary: Color(0xFF0F3F5F), // Dark Blue
  onSecondary: Color(0xFFFFFFFF), // Pure White
  error: Color(0xFFCF6679), // Light Red
  onError: Color(0xFF121212), // Very Dark Gray
  background: Color(0xFF121212), // Very Dark Gray
  onBackground: Color(0xFFE0E0E0), // Light Gray
  surface: Color(0xFF1E1E1E), // Dark Gray
  onSurface: Color(0xFFE0E0E0), // Light Gray
);



// ThemeData for Dark Mode
ThemeData darkModeTheme = ThemeData(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
);