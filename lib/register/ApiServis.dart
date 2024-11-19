import 'dart:convert';
import 'package:http/http.dart' as http;
import 'PostModel.dart';

class ApiService {
  // Change the URL to the login endpoint
  final String baseUrl = 'https://mediadwi.com/api/latihan/login';

  Future<PostModel> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return PostModel.fromJson(jsonResponse); // Return the model from the response
    } else {
      throw Exception('Failed to login');
    }
  }

  registerUser(String username, String password, String fullName, String email) {}
}
