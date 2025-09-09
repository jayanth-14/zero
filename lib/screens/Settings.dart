import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:zero/theme/themes.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('settings');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // THEME MODE SELECTION
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                final mode = themeProvider.getThemeMode(); // "system" | "light" | "dark"

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Theme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      CupertinoSlidingSegmentedControl<String>(
                        groupValue: mode,
                        children: const {
                          "system": Text("System"),
                          "light": Text("Light"),
                          "dark": Text("Dark"),
                        },
                        onValueChanged: (value) {
                          if (value != null) {
                            themeProvider.setThemeMode(value);
                            box.put("theme_mode", value); // persist choice
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // LANGUAGE preferences (example)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: const Text(
                "Language",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                box.get("languages", defaultValue: "English"),
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // TODO: open language picker
              },
            ),
          ),

          const SizedBox(height: 16),

          // About section
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              title: Text(
                "About App",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Version 1.0.0"),
              trailing: Icon(Icons.info_outline),
            ),
          ),
        ],
      ),
    );
  }
}
