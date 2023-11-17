import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'widgets/card_bolsa_valor.dart';
import 'dart:convert';

import 'widgets/card_moeda.dart';
import 'widgets/card_moeda_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeMaterial(),
    );
  }
}

/*class HomeMaterial extends StatelessWidget {
  const HomeMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cotações Brasil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card
            const CardMoeda(
              nomeMoeda: 'EURO', 
              valorMoeda: '5.2346', 
              variacaoMoeda: '+0.01',),
            const SizedBox(height: 20),
            const Text(
              'Outras moedas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const CardMoedaItem(
                    nomeMoeda: 'LIBRA ESTERLINA',
                    valorMoeda: '6.017',
                    variacaoMoeda: '+1.04',
                  ),
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "EURO",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "5.2597",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("-0.011"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "EURO",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "5.2597",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("-0.011"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "EURO",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "5.2597",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("-0.011"),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "EURO",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "5.2597",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text("-0.011"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bolsa de Valores',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BolsaValoresItem(
                  nomeBolsa: 'Ibovespa', 
                  localBolsa: 'Sao Paulo, Brasil', 
                  valorBolsa: '1.69',),
                Column( 
                  children: [
                    Text(
                      "IBOVESPA",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sao Paulo, Brazil",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1.69",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  late Future<Map<String, dynamic>> dadosCotacoes;

  @override
  void initState() {
    super.initState();
    dadosCotacoes = getDadosCotacoes();
  }

  Future<Map<String, dynamic>> getDadosCotacoes() async {
    //print("get dados");
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.hgbrasil.com/finance?key=3c73fbb9',
        ),
      );

      if (res.statusCode != HttpStatus.ok) {
        throw 'Erro de conexão';
      }

      final data = jsonDecode(res.body);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cotações Brasil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
          future: dadosCotacoes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final data = snapshot.data!;

            final dadosDolar = data['results']['currencies']['USD'];
            final lista = data['results']['currencies'].values.toList();
            final listaStocks = data['results']['stocks'].values.toList();
            lista.removeAt(0);
            lista.removeAt(0);
            //print(listaBolsas);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CardMoeda(
                      nomeMoeda: dadosDolar['name'],
                      valorMoeda: "${dadosDolar['buy']}",
                      variacaoMoeda: "${dadosDolar['variation']}"),
                  const SizedBox(height: 20),
                  const Text(
                    'Outras moedas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: lista.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CardMoedaItem(
                              nomeMoeda: lista[index]['name'],
                              valorMoeda: "${lista[index]['buy']}",
                              variacaoMoeda: "${lista[index]['variation']}");
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Bolsa de Valores',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listaStocks.length,
                      itemBuilder: (context, index) {
                        return CardBolsaValor(
                          nomeBolsa: listaStocks[index]['name'],
                          localBolsa: listaStocks[index]['location'],
                          valorBolsa: "${listaStocks[index]['points']}",
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
