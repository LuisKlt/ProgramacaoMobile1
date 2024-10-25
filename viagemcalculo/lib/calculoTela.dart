import 'package:viagemcalculo/model/carro.dart';
import 'package:viagemcalculo/model/combustivel.dart';
import 'package:viagemcalculo/model/destino.dart';
import 'package:flutter/material.dart';

class CalculoTela extends StatefulWidget {
  final List<Carro> carro;
  final List<Destino> destino;
  final List<Combustivel> combustivel;
  const CalculoTela(
      {super.key,
      required this.carro,
      required this.destino,
      required this.combustivel});

  @override
  State<CalculoTela> createState() => _CalculoTelaState();
}

class _CalculoTelaState extends State<CalculoTela> {
  String? _carroEscolhido;
  String? _destinoEscolhido;
  String? _combustivelEscolhido;
  double? _custoTotal;
  void calcular() {
    Carro carro =
        widget.carro.firstWhere((carro) => carro.nomeCarro == _carroEscolhido);
    Destino destino = widget.destino
        .firstWhere((destino) => destino.nomeDestino == _destinoEscolhido);
    Combustivel combustivel = widget.combustivel.firstWhere(
        (combustivel) => combustivel.tipoCombustivel == _combustivelEscolhido);
    setState(() {
      _custoTotal = destino.distanciaDestino /
          carro.autonomia *
          combustivel.precoCombustivel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                "Calcular Custo",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 35),
              SizedBox(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Selecione um carro"),
                  value: _carroEscolhido,
                  items: widget.carro.map((Carro carro) {
                    return DropdownMenuItem<String>(
                      value: carro.nomeCarro,
                      child: Text(carro.nomeCarro),
                    );
                  }).toList(),
                  onChanged: (String? novoCarro) {
                    setState(() {
                      _carroEscolhido = novoCarro;
                    });
                  },
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Selecione um Destino"),
                  value: _destinoEscolhido,
                  items: widget.destino.map((Destino destino) {
                    return DropdownMenuItem<String>(
                      value: destino.nomeDestino,
                      child: Text(destino.nomeDestino),
                    );
                  }).toList(),
                  onChanged: (String? novoDestino) {
                    setState(() {
                      _destinoEscolhido = novoDestino;
                    });
                  },
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text("Selecione um Combustível"),
                  value: _combustivelEscolhido,
                  items: widget.combustivel.map((Combustivel combustivel) {
                    return DropdownMenuItem<String>(
                      value: combustivel.tipoCombustivel,
                      child: Text(combustivel.tipoCombustivel),
                    );
                  }).toList(),
                  onChanged: (String? novoCombustivel) {
                    setState(() {
                      _combustivelEscolhido = novoCombustivel;
                    });
                  },
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 500,
                height: 50,
                child: ElevatedButton(
                  onPressed: calcular,
                  style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 91, 136)),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: const Text('Calcular'),
                ),
              ),
              const SizedBox(height: 35),
              if (_custoTotal != null)
                SizedBox(
                  child: Text(
                    'Valor total BRL: $_custoTotal',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
