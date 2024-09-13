import 'package:flutter/material.dart';
import 'package:projetolista/card.dart';
import 'package:projetolista/model/pessoa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App lista",
      home: Tela1(),
    );
  }
}

class Tela1 extends StatefulWidget {

  Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  List<Pessoa> lista = [
    Pessoa(nome: "Luis", sobrenome: "Lima", cpf: "000.000.000-00", idade: 21),
    Pessoa(nome: "Eduardo", sobrenome: "Freitas", cpf: "111.111.111-11", idade: 22),
    Pessoa(nome: "Fulano", sobrenome: "Detal", cpf: "222.222.222-22", idade: 23),
    Pessoa(nome: "Fulaninho", sobrenome: "Detal", cpf: "222.222.222-00", idade: 9),
  ];

  void removerItem(int index){
    setState(() {
      lista.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Lista para Widget"),
        backgroundColor: const Color.fromARGB(255, 255, 196, 0),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return Cartao(
            nome: lista[index].nome,
            sobrenome: lista[index].sobrenome,
            onRemove: ()=> removerItem(index),
          );
        },
      ),
    );
  }
}