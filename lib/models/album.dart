class Album {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String url;
  final int songCount;
  final String releaseDate;
  final List<String> artists;

  Album({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.url,
    required this.songCount,
    required this.releaseDate,
    required this.artists,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json["id"] ?? "",
      title: json["name"] ?? "",
      subtitle: json["subtitle"] ?? "",
      image: (json["image"] is List && json["image"].isNotEmpty) 
          ? json["image"][0]["link"] 
          : (json["image"] ?? ""),
      url: json["url"] ?? "",
      songCount: json["song_count"] ?? 0,
      releaseDate: json["release_date"] ?? "",
      artists: (json["artist_map"]?["artists"] as List<dynamic>?)
              ?.map((a) => a["name"].toString())
              .toList() 
          ?? [],
    );
  }
}
