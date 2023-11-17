import 'package:flutter/material.dart';

class CardMoeda extends StatelessWidget {

  final String nomeMoeda;  // final pq o valor n muda(n existe final em stateful)
  final String valorMoeda;
  final String variacaoMoeda;



  const CardMoeda({
    super.key, required this.nomeMoeda, required this.valorMoeda, required this.variacaoMoeda,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 3, // sombra do card
        shape: RoundedRectangleBorder( // formato do primeiro card (Dollar)
          borderRadius: BorderRadius.circular(16),
        ),
        child:  Padding( // conteudo do card
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                nomeMoeda, // mudei para nomeMoeda
                style: const TextStyle(
                  fontSize: 32, // alterar tamanho da letra
                  fontWeight: FontWeight.bold, // alterar fonte da letra
                ),
              ),
              const SizedBox(height: 16),
              Text(
               valorMoeda, // R\$ 4.9544',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                variacaoMoeda, // mudei o +0,00' pela variavel variacaoMoeda
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
