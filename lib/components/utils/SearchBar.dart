import 'package:flutter/material.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({super.key});

  @override
  State<AppSearch> createState() => _AppSearchState();
}

class _AppSearchState extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          leading: Icon(Icons.search_rounded),
          elevation: WidgetStatePropertyAll(1) ,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          hintText: "Songs, albums or artists",
          // backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
          onTap: () {
            controller.openView();
          },
          onChanged: (value) {
            controller.openView();
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
