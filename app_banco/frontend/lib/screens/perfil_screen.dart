import 'package:flutter/material.dart';
import 'package:app_banco/services/auth_service.dart';
import 'package:app_banco/screens/login.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  void _logout(BuildContext context) async {
    final authService = AuthService();
    await authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _logout(context),
        child: const Text('Cerrar Sesión'),
      ),
    );
  }
}
