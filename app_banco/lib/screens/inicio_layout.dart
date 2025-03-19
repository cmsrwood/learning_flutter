import 'package:flutter/material.dart';
import 'package:app_banco/screens/perfil_screen.dart';
import 'package:app_banco/screens/transacciones_screen.dart';
import '../widgets/inicio_content.dart';

class InicioLayout extends StatefulWidget {
  const InicioLayout({super.key});

  @override
  State<InicioLayout> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioLayout> {
  int _currentIndex = 0;
  double saldo = 0.0;
  double valorTransaccion = 50.0;
  List transacciones = [];

  void depositar() {
    setState(() {
      saldo += valorTransaccion;
      transacciones.add({
        'tipo': 'Deposito',
        'fecha': DateTime.now(),
        'cantidad': "\$${valorTransaccion.toStringAsFixed(2)}",
        'icono': Icons.monetization_on,
        'color': Colors.green,
      });
    });
  }

  void retirar() {
    if (saldo >= valorTransaccion) {
      setState(() {
        saldo -= valorTransaccion;
        transacciones.add('Retiro: -\$${valorTransaccion.toStringAsFixed(2)}');
      });
    } else {
      showError('Saldo insuficiente');
    }
  }

  void pagar() {
    if (saldo >= valorTransaccion) {
      setState(() {
        saldo -= valorTransaccion;
        transacciones.add('Pago: -\$${valorTransaccion.toStringAsFixed(2)}');
      });
    } else {
      showError('Saldo insuficiente');
    }
  }

  void transferir() {
    if (saldo >= valorTransaccion) {
      setState(() {
        saldo -= valorTransaccion;
        transacciones.add(
          'Transferencia: -\$${valorTransaccion.toStringAsFixed(2)}',
        );
      });
    } else {
      showError('Saldo insuficiente');
    }
  }

  void showError(String msg) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Error'),
            content: Text(msg),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      InicioContent(saldo: saldo, transacciones: transacciones),
      TransaccionesScreen(
        depositar: depositar,
        retirar: retirar,
        pagar: pagar,
        transferir: transferir,
      ),
      const PerfilScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transacciones',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
