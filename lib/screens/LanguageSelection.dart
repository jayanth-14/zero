import 'package:flutter/material.dart';
import 'package:zero/components/OptionSelection.dart';
import 'package:zero/components/WelcomAboard.dart';
import 'package:zero/constants/preferences.dart';
import 'package:zero/screens/Home.dart';

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
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(30, 40, 30, 40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Welcomeaboard(),
            SizedBox(height: 50),
            Optionselection(
              title: "Language Selection",
              hintText: "Which language songs would you prefer to listen to?",
              options: Preferences.languages,
              id: "languages",
              multiSelect: true,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
                        },
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                          ),
                          textStyle: WidgetStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.primary,
                          ),
                          foregroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.secondary,
                          ),
                          // padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsetsGeometry.fromLTRB(40, 10, 40, 10))
                          minimumSize: WidgetStateProperty.all<Size>(
                            Size(double.infinity, 50),
                          ),
                        ),
                        child: Text("Continue"),
                      ),
          ],
        ),
      ),
    );
  }
}
