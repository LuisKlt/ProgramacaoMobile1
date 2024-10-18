import 'package:flutter/material.dart';
import 'package:telalogin/loginpage.dart';

void main() {
  runApp(const MyApp());
}

/*
-------------------------------

  ATENÇÃO, A SENHA É: bike70

-------------------------------
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tela de Login",
      home: LoginPage(),
    );
  }
}
