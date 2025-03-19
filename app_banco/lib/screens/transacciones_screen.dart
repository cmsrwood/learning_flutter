import 'package:flutter/material.dart';
import '../widgets/button_accion.dart';

class TransaccionesScreen extends StatelessWidget {
  final VoidCallback depositar;
  final VoidCallback retirar;
  final VoidCallback pagar;
  final VoidCallback transferir;

  const TransaccionesScreen({
    super.key,
    required this.depositar,
    required this.retirar,
    required this.pagar,
    required this.transferir,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Transacciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonAccion(
                onPressed: depositar,
                text: 'Depositar',
                icon: Icons.attach_money,
              ),
              ButtonAccion(
                onPressed: transferir,
                text: 'Transferir',
                icon: Icons.send,
              ),
              ButtonAccion(
                onPressed: pagar,
                text: 'Pagar',
                icon: Icons.payment,
              ),
              ButtonAccion(
                onPressed: retirar,
                text: 'Retirar',
                icon: Icons.remove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
