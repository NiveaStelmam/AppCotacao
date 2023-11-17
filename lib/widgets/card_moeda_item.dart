import 'package:flutter/material.dart';

class CardMoedaItem extends StatelessWidget {
  final String nomeMoeda; // final pq o valor n muda(n existe final em stateful)
  final String valorMoeda;
  final String variacaoMoeda;

  const CardMoedaItem({
    super.key,
    required this.nomeMoeda,
    required this.valorMoeda,
    required this.variacaoMoeda,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              nomeMoeda,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              valorMoeda,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(variacaoMoeda,
                style: const TextStyle(
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
