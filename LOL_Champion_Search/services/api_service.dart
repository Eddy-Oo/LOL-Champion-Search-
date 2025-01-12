import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/champion.dart';

class ApiService {
  static const String baseUrl =
      "https://ddragon.leagueoflegends.com/cdn/13.20.1/data/en_US/champion.json";

  static Future<List<Champion>> fetchChampionData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as Map<String, dynamic>;
        return data.values
            .map((championJson) =>
                Champion.fromJson(championJson as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            "Failed to load champions. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching champions: $e");
    }
  }
}
