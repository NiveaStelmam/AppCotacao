import 'package:flutter/material.dart';

class CardBolsaValor extends StatelessWidget {
  final String nomeBolsa;
  final String localBolsa;
  final String valorBolsa;

  const CardBolsaValor({
    super.key,
    required this.nomeBolsa,
    required this.localBolsa,
    required this.valorBolsa,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nomeBolsa,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          localBolsa,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          valorBolsa,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
