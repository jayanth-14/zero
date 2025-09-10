import 'package:zero/models/songs.dart';

class Album {
  final String id;
  final String title;
  final String image;
  final String releaseDate;
  final List<String> artists;
  final List<Song> songs;

  Album({
    required this.id,
    required this.title,
    required this.image,
    required this.releaseDate,
    required this.artists,
    required this.songs,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    // Pick artists from either `artists` or `artist_map`
    List<String> artists = [];
    if (json['artists'] is List) {
      artists = (json['artists'] as List)
          .map((a) => a["name"].toString())
          .toList();
    } else if (json['artist_map']?['artists'] is List) {
      artists = (json['artist_map']['artists'] as List)
          .map((a) => a["name"].toString())
          .toList();
    }

    return Album(
      id: json["id"] ?? "",
      title: json["name"] ?? "",
      image: (json["image"] is List && (json["image"] as List).isNotEmpty)
          ? ((json["image"] as List).last as Map<String, dynamic>)["link"] ?? ""
          : (json["image"] ?? ""),
      releaseDate: json["release_date"] ?? "",
      artists: artists,
      songs: (json["songs"] as List? ?? [])
          .map((song) => Song.fromJson(song as Map<String, dynamic>))
          .toList(),
    );
  }
}
