import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/theme/themes.dart';

String getLogoByTheme(BuildContext context) {
  final provider = Provider.of<ThemeProvider>(context, listen: false);

  ThemeMode mode = provider.themeMode;

  if (mode == ThemeMode.system) {
    final brightness = MediaQuery.of(context).platformBrightness;
    mode = (brightness == Brightness.dark) ? ThemeMode.dark : ThemeMode.light;
  }

  if (mode == ThemeMode.dark) {
    return 'assets/images/logo_dark.png';
  } else {
    return 'assets/images/logo_light.png';
  }
}
