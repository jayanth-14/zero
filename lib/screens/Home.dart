import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:zero/api/api.dart';
import 'package:zero/components/AppDrawer.dart';
import 'package:zero/components/Home/ModuleRow.dart';
import 'package:zero/components/Texts/Welcome.dart';
import 'package:zero/components/audio/MiniPlayer.dart';
import 'package:zero/components/utils/SearchBar.dart';
import 'package:zero/models/modules.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('settings');
    final String user = box.get('user', defaultValue: 'Guest');
    final MyApi api = MyApi();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
      ),
      drawer: Appdrawer(),
      bottomNavigationBar: MiniPlayer(),
      body: FutureBuilder<List<Module>>(
        future: api.getModules(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No modules found"));
          }

          final modules = snapshot.data!;

          return CustomScrollView(
            slivers: [
              // 👇 Add padding at the top for Welcome + Search
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WelcomeUser(user: user),
                      const SizedBox(height: 10),
                      AppSearch(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),

              // 👇 Module list becomes scrollable part
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ModuleRow(module: modules[index]);
                  },
                  childCount: modules.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
