import 'package:flutter/material.dart';
import 'package:zero/components/OptionSelection.dart';
import 'package:zero/constants/preferences.dart';

class Welcomeaboard extends StatelessWidget {
  const Welcomeaboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 52,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Row(
          children: [
            Text(
              "Aboard",
              style: TextStyle(
                fontSize: 52,
            fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(width: 3),
            Text(
              "!",
              style: TextStyle(
                fontSize: 52,
            fontWeight: FontWeight.w500,

                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        Text(
          "Mind Telling us a few things?",
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
