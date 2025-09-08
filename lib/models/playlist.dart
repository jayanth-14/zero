class Playlist {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String url;
  final int followerCount;
  final int songCount;

  Playlist({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.url,
    required this.followerCount,
    required this.songCount,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json["id"] ?? "",
      title: json["name"] ?? "",
      subtitle: json["subtitle"] ?? "",
      image: (json["image"] is List && json["image"].isNotEmpty) 
          ? json["image"][0]["link"] 
          : (json["image"] ?? ""),
      url: json["url"] ?? "",
      followerCount: json["follower_count"] ?? 0,
      songCount: json["song_count"] ?? 0,
    );
  }
}
