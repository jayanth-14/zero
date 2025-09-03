import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/screens/start.dart';
import 'package:zero/theme/darkMode.dart';
import 'package:zero/theme/lightMode.dart';
import 'package:zero/theme/themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const Zero(),
    ),
  );
}

class Zero extends StatelessWidget {
  const Zero({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'ZERO',
          debugShowCheckedModeBanner: false,
          home: Start(),
          theme: lightModeTheme,       // your custom light theme
          darkTheme: darkModeTheme,   // your custom dark theme
          themeMode: themeProvider.themeMode, // system / light / dark
        );
      },
    );
  }
}
