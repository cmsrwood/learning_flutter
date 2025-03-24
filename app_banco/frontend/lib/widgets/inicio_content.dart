import 'package:flutter/material.dart';

class InicioContent extends StatelessWidget {
  final double saldo;
  final List transacciones;
  const InicioContent({
    super.key,
    required this.saldo,
    required this.transacciones,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Card(
              color: Colors.blueAccent,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const Text(
                      'Saldo Disponible',
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${saldo.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Transacciones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...transacciones.isNotEmpty
                ? transacciones.reversed
                    .map(
                      (t) => Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    t['tipo'] == 'Deposito'
                                        ? Icons.monetization_on
                                        : t['tipo'] == 'Retiro'
                                        ? Icons.money_off
                                        : t['tipo'] == 'Pago'
                                        ? Icons.payment
                                        : t['tipo'] == 'Transferencia'
                                        ? Icons.send
                                        : Icons.error,
                                    color: t['tipo'] == 'Deposito'
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(t['tipo']),
                                ],
                              ),
                              Text(
                                t['cantidad'].toString(),
                                style: TextStyle(
                                  color: t['color'],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Fecha: ${t['fecha'].toString()}")],
                          ),
                        ),
                      ),
                    )
                    .toList()
                : [const Text('No hay transacciones')],
          ],
        ),
      ),
    );
  }
}
