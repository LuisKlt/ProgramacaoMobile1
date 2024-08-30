import 'package:flutter/material.dart';
import 'package:teste/botao.dart';

class MaisUmDia extends StatelessWidget {
  final String nome;
  const MaisUmDia({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
          Text(
            "$nome",
            style: TextStyle(fontSize: 40),
          ),
          NovoBotao("Teste 1", ()=>print("1")),
          SizedBox(height: 20,),
          NovoBotao("Teste 2", ()=>print("2")),
          SizedBox(height: 20,),
          NovoBotao("Teste 3", ()=>print("3")),
          TextButton(
            onPressed: () {},
            child: Text("Botão 2"),
          )
        ],
      ),
    );
  }
}
