import 'package:flutter/material.dart';
import 'package:zero/components/OptionSelection.dart';
import 'package:zero/components/WelcomAboard.dart';
import 'package:zero/constants/preferences.dart';

class Languageselection extends StatefulWidget {
  const Languageselection({super.key});

  @override
  State<Languageselection> createState() => _LanguageselectionState();
}

class _LanguageselectionState extends State<Languageselection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(padding: EdgeInsetsGeometry.fromLTRB(30, 40, 30, 40),
      child: 
       Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Welcomeaboard(),
          SizedBox(height: 50),
        Optionselection(title: "Language Selection", hintText: "Which language songs would you prefer to listen to?", options: Preferences.languages, multiSelect: true,)
        ],
      )
      ,)
    );
  }
}