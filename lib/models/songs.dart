class Song {
  final String id;
  final String title;
  final String image;
  final String album;
  final String albumId;
  final int duration;
  final List<String> artists;
  final String downloadUrl;

  Song({
    required this.id,
    required this.title,
    required this.image,
    required this.album,
    required this.albumId,
    required this.duration,
    required this.artists,
    required this.downloadUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json["id"] ?? "",
      title: json["name"] ?? "",
      image: (json["image"] is List && (json["image"] as List).isNotEmpty)
          ? ((json["image"] as List).last as Map<String, dynamic>)["link"] ?? ""
          : (json["image"] ?? ""),
      album: json["album"] ?? "",
      albumId: json["album_id"] ?? "",
      duration: int.tryParse(json["duration"]?.toString() ?? "0") ?? 0,
      artists: (json["artist_map"]?["primary_artists"] as List<dynamic>?)
              ?.map((a) => a["name"].toString())
              .toList() ??
          [],
      downloadUrl: (json['download_url'] is List &&
              (json['download_url'] as List).isNotEmpty)
          ? ((json['download_url'] as List).last as Map<String, dynamic>)["link"] ??
              ""
          : "",
    );
  }
}
