import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/GetPostedProperty.dart';
import '../models/MyUnlockProperty.dart';


class PropertyService {
  final String baseUrl = "http://10.0.2.2:8080";
  // final String propertyUnlockBaseUrl = "http://10.0.2.2:8080";

  Future<List<GetPostedProperty>> fetchPostedProperties() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/user/all/posted/properties"),
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
    int? userId = prefs.getInt("id");

    if (token == null || token.isEmpty || userId == null) return false;

    final response = await http.post(
      Uri.parse("$baseUrl/api/user/property/unlock"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "userId": userId,
        "propertyPostId": propertyId,
      }),
    );

    return response.statusCode == 200;
  }

  Future<List<MyUnlockProperty>> fetchUnlockedProperties() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final userId = prefs.getInt("id");

    if (token == null || userId == null) {
      throw Exception("User not logged in.");
    }

    final response = await http.get(
      Uri.parse("$baseUrl/api/user/property/unlock/me?id=$userId"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((item) => MyUnlockProperty.fromJson(item)).toList();
    } else {
      throw Exception("Failed to fetch unlocked properties.");
    }
  }


}