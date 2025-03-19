import 'package:flutter/material.dart';
import 'screens/inicio_layout.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco',
      home: InicioLayout(),
    );
  }
}
