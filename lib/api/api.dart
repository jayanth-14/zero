import 'package:hive/hive.dart';

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

  
}