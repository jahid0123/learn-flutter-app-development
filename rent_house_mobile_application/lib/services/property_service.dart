import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/GetPostedProperty.dart';


class PropertyService {
  final String baseUrl = "http://10.0.2.2:8080/api/user/all/posted/properties";

  Future<List<GetPostedProperty>> fetchPostedProperties() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      //headers: {"Authorization": "Bearer $token"},
    );

    // print("Status: ${response.statusCode}");
    // print("Body: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      if (decoded is List) {
        return decoded
            .map((e) => GetPostedProperty.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Expected List but got: ${decoded.runtimeType}");
      }
    } else {
      throw Exception("Failed to load properties: ${response.body}");
    }
  }

  Future<bool> unlockProperty(int propertyId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token == null || token.isEmpty) return false;

    final response = await http.get(
      Uri.parse("$baseUrl/api/property-post/unlock/$propertyId"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return response.statusCode == 200;
  }
}