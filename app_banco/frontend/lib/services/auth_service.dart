import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = FlutterSecureStorage();
  final String _baseUrl = 'http://localhost:3000/api/personas/usuarios/';

  Future<bool> login(String email, String password) async {
    final url = Uri.parse("$_baseUrl/ingresar");
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

  Future<bool> registro(
    String email,
    String password,
    String nombre,
    String apellido,
  ) async {
    final url = Uri.parse("$_baseUrl/registrar");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'nombre': nombre,
        'apellido': apellido,
      }),
    );

    if (response.statusCode != 200) {
      AlertDialog(
        title: const Text('Error'),
        content: Text(
          'Error al registrar el usuario: ${response.statusCode} - ${response.body}',
        ),
      );
      return false;
    }

    await login(email, password);

    return true;
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
