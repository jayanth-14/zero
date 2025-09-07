import 'package:flutter/material.dart';
import 'package:zero/utils/string.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({super.key, required this.user});
  final String user;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Hi There,', style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary
      )),
      Text(Captilize(user),style: TextStyle(
        fontSize: 22
      ))
    ],);
  }
}