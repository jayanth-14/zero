import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:zero/screens/Home.dart';
import 'package:zero/screens/start.dart';
import 'package:zero/theme/darkMode.dart';
import 'package:zero/theme/lightMode.dart';
import 'package:zero/theme/themes.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('settings');
  
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.surface, // matches background
        statusBarIconBrightness: Brightness.dark, // for dark icons
        statusBarBrightness: Brightness.light, // iOS-specific
      ),
    );
    var box = Hive.box('settings');
    String? languages = box.get('languages');
    Widget start = (languages == null) ? Start() : Home();
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'ZERO',
          debugShowCheckedModeBanner: false,
          home: start,
          theme: lightModeTheme,       // your custom light theme
          darkTheme: darkModeTheme,   // your custom dark theme
          themeMode: themeProvider.themeMode, // system / light / dark
        );
      },
    );
  }
}
