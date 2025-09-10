import 'package:flutter/material.dart';
import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';

class MiniPlayer extends StatelessWidget {
  final AudioHandler _audioHandler = GetIt.instance<AudioHandler>();

  MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MediaItem?>(
      stream: _audioHandler.mediaItem,
      builder: (context, snapshot) {
        final mediaItem = snapshot.data;
        if (mediaItem == null) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.all(5),
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                // Thumbnail
                if (mediaItem.artUri != null)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        mediaItem.artUri.toString(),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const SizedBox(width: 10),

                // Song title & artist
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mediaItem.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (mediaItem.artist != null)
                        Text(
                          mediaItem.artist!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                ),

                // Previous Button
                IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {
                  _audioHandler.skipToPrevious();
                },
              ),
                // Play / Pause button
                StreamBuilder<PlaybackState>(
                  stream: _audioHandler.playbackState,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    final playing = state?.playing ?? false;

                    return IconButton(
                      icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        playing ? _audioHandler.pause() : _audioHandler.play();
                      },
                    );
                  },
                ),

                // Next button
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  onPressed: () {
                    _audioHandler.skipToNext();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
