class Song {
  final String id;
  final String title;
  final String subtitle; // e.g. artist names
  final String url; // perma_url
  final String image;
  final String album;
  final String albumId;
  final int duration; // in seconds
  final List<String> artists;
  final Map<String, String> downloadUrls; // { "96kbps": "...", "320kbps": "..." }

  Song({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.image,
    required this.album,
    required this.albumId,
    required this.duration,
    required this.artists,
    required this.downloadUrls,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json["id"] ?? "",
      title: json["name"] ?? "",
      subtitle: json["subtitle"] ?? "",
      url: json["url"] ?? "",
      image: (json["image"] is List && json["image"].isNotEmpty) 
          ? json["image"][0]["link"] 
          : (json["image"] ?? ""),
      album: json["album"] ?? "",
      albumId: json["album_id"] ?? "",
      duration: json["duration"] ?? 0,
      artists: (json["artist_map"]?["artists"] as List<dynamic>?)
              ?.map((a) => a["name"].toString())
              .toList() 
          ?? [],
      downloadUrls: (json["download_url"] as List<dynamic>?)
              ?.asMap()
              .map((_, e) => MapEntry(e["quality"].toString(), e["link"].toString())) 
          ?? {},
    );
  }
}
