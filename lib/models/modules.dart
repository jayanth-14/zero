class Module {
  final String title;
  final List<Map<String, dynamic>> items;

  Module({required this.title, required this.items});

  /// Factory to parse from JSON
  factory Module.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    return Module(
      title: json['title'] ?? '',
      items: rawData is List
          ? rawData.map((e) => Map<String, dynamic>.from(e)).toList()
          : [], // 👈 safe fallback
    );
  }
}
