import 'package:viagemcalculo/model/Carro.dart';
import 'package:viagemcalculo/model/CarroDAO.dart';
import 'package:viagemcalculo/model/Combustivel.dart';
import 'package:viagemcalculo/model/CombustivelDAO.dart';
import 'package:viagemcalculo/model/Destino.dart';
import 'package:flutter/material.dart';
import 'package:viagemcalculo/model/destinoDAO.dart';

class CalculoTela extends StatefulWidget {
  const CalculoTela({super.key});

  @override
  State<CalculoTela> createState() => _CalculoTelaState();
}

class _CalculoTelaState extends State<CalculoTela> {
  List<Carro> carros = [];
  List<Destino> destinos = [];
  List<Combustivel> combustiveis = [];
  Carro? carroSelecionado;
  Destino? destinoSelecionado;
  Combustivel? combustivelSelecionado;

  final CarroDAO carroDAO = CarroDAO();
  final DestinoDAO destinoDAO = DestinoDAO();
  final CombustivelDAO combustivelDAO = CombustivelDAO();

  double? custoViagem;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    List<Carro> listaCarros = await carroDAO.selectCarros();
    List<Destino> listaDestinos = await destinoDAO.selectDestinos();
    List<Combustivel> listaCombustiveis =
        await combustivelDAO.selectCombustiveis();
    setState(() {
      carros = listaCarros;
      destinos = listaDestinos;
      combustiveis = listaCombustiveis;
    });
  }

  void calcular() {
    if (carroSelecionado != null &&
        destinoSelecionado != null &&
        combustivelSelecionado != null) {
      int distancia = destinoSelecionado!.distancia;
      double consumo = carroSelecionado!.autonomia;
      double precoCombustivel = combustivelSelecionado!.preco;

      setState(() {
        custoViagem = (distancia / consumo) * precoCombustivel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            const Text(
              "Calcular Custo",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 360,
              child: DropdownButton<Carro>(
                value: carroSelecionado,
                hint: Text('Selecione um carro'),
                isExpanded: true,
                items: carros.map((carro) {
                  return DropdownMenuItem<Carro>(
                    value: carro,
                    child: Text(carro.nome),
                  );
                }).toList(),
                onChanged: (Carro? novoCarro) {
                  setState(() {
                    carroSelecionado = novoCarro;
                  });
                },
              ),
            ),
            SizedBox(
              width: 360,
              child: DropdownButton<Destino>(
                value: destinoSelecionado,
                hint: Text('Selecione um destino'),
                isExpanded: true,
                items: destinos.map((destino) {
                  return DropdownMenuItem<Destino>(
                    value: destino,
                    child: Text(destino.nome),
                  );
                }).toList(),
                onChanged: (Destino? novoDestino) {
                  setState(() {
                    destinoSelecionado = novoDestino;
                  });
                },
              ),
            ),
            SizedBox(
              width: 360,
              child: DropdownButton<Combustivel>(
                value: combustivelSelecionado,
                hint: Text('Selecione um combustível'),
                isExpanded: true,
                items: combustiveis.map((combustivel) {
                  return DropdownMenuItem<Combustivel>(
                    value: combustivel,
                    child: Text(combustivel.tipo),
                  );
                }).toList(),
                onChanged: (Combustivel? novoCombustivel) {
                  setState(() {
                    combustivelSelecionado = novoCombustivel;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
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
            SizedBox(height: 10),
            if (custoViagem != null)
              Text(
                'Custo da viagem: R\$ ${custoViagem!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }

  /*
  List<Carro> carro = [];
  Carro? carroSelecionado;
  final CarroDAO carroDAO = CarroDAO();

  @override
  void initState() {
    super.initState();
    carregarCarros();
  }

  Future<void> carregarCarros() async {
    List<Carro> lista = await carroDAO.selectCarros();
    setState(() {
      carro = lista;
    });
  }
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo de Carro'),
      ),
      body: Center(
        child: carros.isEmpty
            ? CircularProgressIndicator()
            : DropdownButton<Carro>(
                value: carroSelecionado,
                hint: Text('Selecione um carro'),
                items: carros.map((carro) {
                  return DropdownMenuItem<Carro>(
                    value: carro,
                    child: Text('${carro.nome} ${carro.autonomia}'),
                  );
                }).toList(),
                onChanged: (Carro? novoCarro) {
                  setState(() {
                    carroSelecionado = novoCarro;
                  });
                },
              ),
      ),
    );
  }*/

  String? _carroEscolhido;
  String? _destinoEscolhido;
  String? _combustivelEscolhido;
  double? _custoTotal;
  void calcular() {
    Carro carro =
        carro.firstWhere((carro) => carro.nome == _carroEscolhido);
    Destino destino = widget.destino
        .firstWhere((destino) => destino.nome == _destinoEscolhido);
    Combustivel combustivel = widget.combustivel
        .firstWhere((combustivel) => combustivel.tipo == _combustivelEscolhido);
    setState(() {
      _custoTotal = destino.distancia / carro.autonomia * combustivel.preco;
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
                child: carro.isEmpty
            ? CircularProgressIndicator()
            : DropdownButton<Carro>(
                value: carroSelecionado,
                hint: Text('Selecione um carro'),
                items: carro.map((carro) {
                  return DropdownMenuItem<Carro>(
                    value: carro,
                    child: Text('${carro.nome} ${carro.autonomia}'),
                  );
                }).toList(),
                onChanged: (Carro? novoCarro) {
                  setState(() {
                    carroSelecionado = novoCarro;
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
                      value: destino.nome,
                      child: Text(destino.nome),
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
                      value: combustivel.tipo,
                      child: Text(combustivel.tipo),
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
  }*/
}
