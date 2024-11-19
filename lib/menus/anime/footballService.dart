import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_shofiyyulhilmi/menus/anime/football_Model.dart';

class FootballService {
  // Updated base URL for English Premier League teams
  static const String baseUrl = 'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League';

  static Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> teamsData = jsonResponse['teams']; // 'teams' instead of 'data'
        
        return teamsData.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load English Premier League teams');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
