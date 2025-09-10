import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:zero/models/modules.dart';
import 'package:zero/models/songs.dart';
import 'package:zero/screens/AlbumScreen.dart';
import 'package:get_it/get_it.dart';
import 'package:zero/screens/AudioPlayer.dart';
import 'package:zero/services/audioPlayerProvider.dart';
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
    final AudioHandler _audioHandler = GetIt.instance<AudioHandler>();
      Future<void> _playSong(Song song, String? songId,) async {
    await (_audioHandler as dynamic).addTracks(
      [song],
      playlistId: songId,
    );
    await _audioHandler.skipToQueueItem(0);
    await _audioHandler.play();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AudioPlayerScreen(index: 0),
      ),
    );
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
                    if (item['type'] == "song") {
                      final Song song = Song.fromJson(item);
                     _playSong(song, song.albumId);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AlbumScreen(id: id, type : type)
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
