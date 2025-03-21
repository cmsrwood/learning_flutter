import 'package:flutter/material.dart';
import '../widgets/button_accion.dart';

class TransaccionesScreen extends StatelessWidget {
  final void Function(double) depositar;
  final void Function(double) retirar;
  final void Function(double) pagar;
  final void Function(double) transferir;

  const TransaccionesScreen({
    super.key,
    required this.depositar,
    required this.retirar,
    required this.pagar,
    required this.transferir,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController valorTransaccion = TextEditingController();

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Transacciones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: 300,
            child: TextField(
              controller: valorTransaccion,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Valor de la transacción',
              ),
            ),
          ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonAccion(
                onPressed: () => depositar(double.parse(valorTransaccion.text)),
                text: 'Depositar',
                icon: Icons.attach_money,
              ),

              ButtonAccion(
                onPressed:
                    () => transferir(double.parse(valorTransaccion.text)),
                text: 'Transferir',
                icon: Icons.send,
              ),
              ButtonAccion(
                onPressed: () => pagar(double.parse(valorTransaccion.text)),
                text: 'Pagar',
                icon: Icons.payment,
              ),
              ButtonAccion(
                onPressed: () => retirar(double.parse(valorTransaccion.text)),
                text: 'Retirar',
                icon: Icons.money_off,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
