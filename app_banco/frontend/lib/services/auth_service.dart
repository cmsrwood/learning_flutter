import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = FlutterSecureStorage();
  final String _baseUrl = 'http://localhost:3000/api/personas/usuarios/ingresar';

  Future<bool> login(String email, String password) async {
    final url = Uri.parse(_baseUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final token = json['token'];

      await _storage.write(key: 'jwt', value: token);
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'jwt');
  }

  Future<void> logout() async {
    await _storage.delete(key: 'jwt');
  }

  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
