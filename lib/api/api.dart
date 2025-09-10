import 'package:hive/hive.dart';
import 'package:zero/models/album.dart';
import 'package:zero/models/modules.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';


class MyApi {
  final String baseUrl = 'https://rhythm-api.vercel.app/';
  final Map<String, String> endpoints = {
    "home":"modules",
    "search":"search",
    "album":"album",
    "song":"song",
    "playlist":"playlist",
  };
  final box = Hive.box('settings');

  Future<List<Module>> getModules() async { 
  String languages = box.get("languages", defaultValue: "telugu");
  try {
    final response = await http.get(Uri.parse('$baseUrl${endpoints["home"]}?lang=$languages'));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final modulesMap = decoded['data'] as Map<String, dynamic>; // 👈 Map, not List
      final modules = modulesMap.values
          .map((m) => Module.fromJson(m))
          .toList();

      print("Fetched ${modules.length} modules");
      return modules;
    }
  } catch (e) {
    log("There is an error in fetching modules from API $e");
  }
  return [];
}

Future<Album> getAlbum(String id, String type ) async {
  final response = await http.get(Uri.parse('$baseUrl${endpoints[type]}?id=$id'));

  if (response.statusCode == 200) {
    final decode = jsonDecode(response.body);
    return Album.fromJson(decode['data']);
  } else {
    throw Exception("Failed to load album (${response.statusCode})");
  }
}


}