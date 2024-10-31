import 'package:viagemcalculo/calculoTela.dart';
import 'package:viagemcalculo/carroTela.dart';
import 'package:viagemcalculo/destinoTela.dart';
import 'package:viagemcalculo/combustivelTela.dart';
import 'package:viagemcalculo/model/Carro.dart';
import 'package:viagemcalculo/model/Combustivel.dart';
import 'package:viagemcalculo/model/Destino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppCustoViagem());
}

class AppCustoViagem extends StatefulWidget {
  const AppCustoViagem({super.key});

  @override
  State<AppCustoViagem> createState() => _AppCustoViagemState();
}

class _AppCustoViagemState extends State<AppCustoViagem> {
  int telaSelecionada = 0;

  List<Carro> listaCarro = [
    Carro(nome: "Audi RS3", autonomia: 11.2),
    Carro(nome: "BMW M3", autonomia: 9.8),
  ];

  List<Destino> listaDestino = [
    Destino(nome: "Santa Maria", distancia: 240),
    Destino(nome: "Porto Alegre", distancia: 490),
  ];

  List<Combustivel> listaCombustivel = [
    Combustivel(preco: 6.69, tipo: "Gasolina", data: ""),
    Combustivel(preco: 4.49, tipo: "Álcool", data: ""),
  ];

  void opcaoSelecionada(int opcao) {
    setState(() {
      telaSelecionada = opcao;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listaTelas = <Widget>[
      const CalculoTela(),
      const CarroTela(),
      const DestinoTela(),
      const CombustivelTela(),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "App Custo Viagem",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("App Custo Viagem"),
            backgroundColor: const Color.fromARGB(255, 0, 91, 136),
            foregroundColor: Colors.white,
          ),
          body: Center(child: listaTelas[telaSelecionada]),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: const Color.fromARGB(255, 94, 94, 94),
            fixedColor: const Color.fromARGB(255, 0, 91, 136),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate_rounded),
                label: 'Calculo',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_rental_rounded),
                label: 'Carro',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: 'Destino',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.gas_meter_rounded),
                label: 'Combustível',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
            ],
            currentIndex: telaSelecionada,
            onTap: opcaoSelecionada,
          ),
        ));
  }
}
