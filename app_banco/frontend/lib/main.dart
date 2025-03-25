import 'package:flutter/material.dart';
import 'package:app_banco/screens/inicio_layout.dart';
import 'package:app_banco/screens/login.dart';
import 'package:app_banco/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  final bool isLoggedIn = await authService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isLoggedIn ? const InicioLayout() : const LoginScreen(),
    );
  }
}
