import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casino',
      home: CasinoPage(),
    );
  }
}

class CasinoPage extends StatefulWidget {
  const CasinoPage({super.key});

  @override
  State<CasinoPage> createState() => _CasinoPageState();
}

class _CasinoPageState extends State<CasinoPage> {
  String ruta1 = 'assets/images/interrogacion.jpg';
  String ruta2 = 'assets/images/interrogacion.jpg';
  String ruta3 = 'assets/images/interrogacion.jpg';
  String mensaje = 'Presiona para jugar';
  bool spinning = false;

  void jugar() {
    if (spinning) {
      return;
    }
    spinning = true;
    int spins = 0;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        List<String> rutas = [
          'assets/images/feliz.jpg',
          'assets/images/seria.jpg',
          'assets/images/triste.jpg',
        ];
        ruta1 = rutas[math.Random().nextInt(rutas.length)];
        ruta2 = rutas[math.Random().nextInt(rutas.length)];
        ruta3 = rutas[math.Random().nextInt(rutas.length)];
        spins++;
        if (spins == 10) {
          timer.cancel();
          spinning = false;
          if (ruta1 == ruta2 && ruta2 == ruta3) {
            mensaje = 'Ganaste! Felicidades';
          } else {
            mensaje = 'Perdiste, vuelve a intentarlo';
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casino', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Gana o Pierde',
            style: TextStyle(color: Colors.red, fontSize: 24),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ruta1, width: 100, fit: BoxFit.cover),
              Image.asset(ruta2, width: 100, fit: BoxFit.cover),
              Image.asset(ruta3, width: 100, fit: BoxFit.cover),
            ],
          ),
          const SizedBox(height: 20),
          Text(mensaje, style: TextStyle(color: Colors.red, fontSize: 24)),
          ElevatedButton(
            onPressed: jugar,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 3,
            ),
            child: const Text('Jugar'),
          ),
        ],
      ),
    );
  }
}
