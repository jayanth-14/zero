class Module<T> {
  final String title;
  final List<T> items;

  Module({
    required this.title,
    required this.items,
  });

  factory Module.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return Module(
      title: json["title"] ?? "",
      items: (json["data"] as List).map((e) => fromJsonT(e)).toList(),
    );
  }
}
