import 'package:flutter/material.dart';
import 'package:teste/maisumdia.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App refatorar",
      home: Scaffold(
          appBar: AppBar(
            title: Text("App Refatorar"),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          body: MaisUmDia(nome: "CHIMPANZÉ")),
    );
  }
}
