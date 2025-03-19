import 'package:flutter/material.dart';

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
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _currentIndex = 0;

  double saldo = 0.0;

  double valorTransaccion = 0.0;

  void depositar() {
    setState(() {
      saldo += valorTransaccion;
    });
  }

  void retirar() {
    if (saldo >= valorTransaccion) {
      setState(() {
        saldo -= valorTransaccion;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Saldo insuficiente'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  void pagar() {
    if (saldo >= valorTransaccion) {
      setState(() {
        saldo -= valorTransaccion;
      });
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Error'),
              content: const Text('Saldo insuficiente'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
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
      InicioContent(saldo: saldo, transacciones: []),
      TransaccionesContent(depositar: depositar, retirar: retirar),
      PerfilContent(),
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

class InicioContent extends StatelessWidget {
  final double saldo;
  final List<Object> transacciones;
  const InicioContent({
    super.key,
    required this.saldo,
    required this.transacciones,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Card(
            color: Colors.blueAccent,
            elevation: 5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Saldo Disponible',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$${saldo.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children:
                transacciones.isNotEmpty
                    ? transacciones
                        .map((transaccion) => Text(transaccion.toString()))
                        .toList()
                    : [Text('No hay transacciones')],
          ),
        ],
      ),
    );
  }
}

class TransaccionesContent extends StatelessWidget {
  final VoidCallback depositar;
  final VoidCallback retirar;
  const TransaccionesContent({
    super.key,
    required this.depositar,
    required this.retirar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Transacciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Transferir
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Transferir',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
              // Depositar
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Depositar',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
              // Pagar
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.credit_card, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pagar',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
              // Retirar
              Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.money_off, color: Colors.white),
                    
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Retirar',
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PerfilContent extends StatelessWidget {
  const PerfilContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Perfil')],
      ),
    );
  }
}
