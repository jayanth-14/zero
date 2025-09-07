import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zero/components/AppDrawer.dart';
import 'package:zero/components/Texts/Welcome.dart';
import 'package:zero/components/utils/SearchBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
  var box = Hive.box('settings');
  final String user = box.get('user', defaultValue: 'Guest');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      drawer: Appdrawer(),
      body: Padding(padding: EdgeInsetsGeometry.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          WelcomeUser(user: user),
          AppSearch()
        ],
      ),
    ));
  }
}