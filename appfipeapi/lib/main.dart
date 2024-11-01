
import 'package:appfipeapi/apiTela.dart';
import 'package:appfipeapi/carroTela.dart';
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

  void opcaoSelecionada(int opcao) {
    setState(() {
      telaSelecionada = opcao;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listaTelas = <Widget>[
      const ApiTela(),
      const CarroTela(),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fipe App",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Fipe App"),
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
                label: 'Tabela Fipe',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_rental_rounded),
                label: 'Carro',
                backgroundColor: Color.fromARGB(255, 196, 196, 196),
              ),
            ],
            currentIndex: telaSelecionada,
            onTap: opcaoSelecionada,
          ),
        ));
  }
}
