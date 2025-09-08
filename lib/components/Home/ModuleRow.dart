import 'package:flutter/material.dart';
import 'package:zero/models/modules.dart';
import 'package:zero/screens/AlbumScreen.dart';
// import '';

class ModuleRow extends StatelessWidget {
  final Module module;

  const ModuleRow({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    // Skip if title is empty
    if (module.title.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              module.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Horizontal list of items
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: module.items.length,
              itemBuilder: (context, index) {
                final item = module.items[index];

                final String id = item["id"] ?? "";
                final String type = item["type"] ?? "";

                // image
                String imageUrl = "";
                final imageField = item["image"];
                if (imageField is String) {
                  imageUrl = imageField;
                } else if (imageField is List && imageField.isNotEmpty) {
                  final lastImage = imageField.last;
                  if (lastImage is Map && lastImage.containsKey("link")) {
                    imageUrl = lastImage["link"].toString();
                  }
                }

                final title = item["name"] ?? "No Title";

                return GestureDetector(
                  onTap: () {
                    if (type == "song") {
                      // TODO: Handle song playback
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Albumscreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl,
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 140,
                              width: 140,
                              color: Colors.grey[900],
                              child: const Icon(Icons.music_note,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
